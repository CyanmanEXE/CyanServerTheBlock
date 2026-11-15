-- Read ZIP member bytes at server boot without adding a native ZIP dependency.
-- Supports standard (non-ZIP64) stored and raw-DEFLATE entries.
-- Uses only standard Lua arithmetic for small, non-negative DEFLATE bit fields.
-- Compatible with Lua hosts where the global bit32 library is missing.
-- No Lua 5.3 bitwise syntax, shell extraction, os.execute, or native dependency.
local Zip = {}
local floor = math.floor
-- All shift widths in this reader are at most 16, and the bit buffer holds
-- at most 23 bits. Lua numbers represent these integers exactly.
local function shift_right(value, count)
    return floor(value / (2 ^ count))
end
local char, sub, byte = string.char, string.sub, string.byte

local function u16(s, p)
    local a, b = byte(s, p, p + 1)
    if not b then return nil end
    return a + 256 * b
end
local function u32(s, p)
    local a, b, c, d = byte(s, p, p + 3)
    if not d then return nil end
    return a + 256 * b + 65536 * c + 16777216 * d
end

-- Huffman symbol tables are keyed by the reversed canonical code because
-- deflate packs the first transmitted bit into the low-order bit position.
local function huffman(lengths)
    local count, next_code, by_length = {}, {}, {}
    local maximum = 0
    for _, length in ipairs(lengths) do
        if length > 0 then
            count[length] = (count[length] or 0) + 1
            if length > maximum then maximum = length end
        end
    end
    local code = 0
    for bits = 1, maximum do
        code = (code + (count[bits - 1] or 0)) * 2
        next_code[bits] = code
        by_length[bits] = {}
    end
    for symbol, length in ipairs(lengths) do
        if length > 0 then
            local current = next_code[length]
            next_code[length] = current + 1
            local reversed = 0
            for i = 1, length do
                reversed = reversed * 2 + (current % 2)
                current = shift_right(current, 1)
            end
            by_length[length][reversed] = symbol - 1
        end
    end
    return { maps = by_length, maximum = maximum }
end

local length_base = {3,4,5,6,7,8,9,10,11,13,15,17,19,23,27,31,35,
    43,51,59,67,83,99,115,131,163,195,227,258}
local length_extra = {0,0,0,0,0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,
    4,4,4,4,5,5,5,5,0}
local distance_base = {1,2,3,4,5,7,9,13,17,25,33,49,65,97,129,
    193,257,385,513,769,1025,1537,2049,3073,4097,6145,8193,12289,16385,24577}
local distance_extra = {0,0,0,0,1,1,2,2,3,3,4,4,5,5,6,6,
    7,7,8,8,9,9,10,10,11,11,12,12,13,13}

local function inflate(input, expected, cap)
    cap = cap or 4 * 1024 * 1024
    if expected and expected > cap then return nil, 'uncompressed size exceeds limit' end
    local input_pos, input_len = 1, #input
    local bits, bits_available = 0, 0
    local output, out_len = {}, 0
    local function read_bits(n)
        while bits_available < n do
            if input_pos > input_len then error('truncated DEFLATE stream') end
            bits = bits + byte(input, input_pos) * (2 ^ bits_available)
            input_pos = input_pos + 1
            bits_available = bits_available + 8
        end
        local result = bits % (2 ^ n)
        bits = shift_right(bits, n)
        bits_available = bits_available - n
        return result
    end
    local function decode(tree)
        local value = 0
        for len = 1, tree.maximum do
            value = value + read_bits(1) * 2 ^ (len - 1)
            local sym = tree.maps[len][value]
            if sym ~= nil then return sym end
        end
        error('invalid DEFLATE Huffman code')
    end
    local function emit(v)
        out_len = out_len + 1
        if out_len > cap then error('DEFLATE output exceeds limit') end
        output[out_len] = v
    end
    local function decompress(lit, dist)
        while true do
            local symbol = decode(lit)
            if symbol < 256 then
                emit(symbol)
            elseif symbol == 256 then
                return
            else
                local li = symbol - 256
                if li < 1 or li > 29 then error('invalid length symbol') end
                local length = length_base[li] + read_bits(length_extra[li])
                local distance_symbol = decode(dist) + 1
                if distance_symbol > 30 then error('invalid distance symbol') end
                local distance = distance_base[distance_symbol] + read_bits(distance_extra[distance_symbol])
                if distance > out_len then error('DEFLATE backreference outside output') end
                for _ = 1, length do emit(output[out_len - distance + 1]) end
            end
        end
    end
    local done = false
    while not done do
        done = read_bits(1) == 1
        local block_type = read_bits(2)
        if block_type == 0 then
            local discard = bits_available % 8
            if discard > 0 then read_bits(discard) end
            local len, complement = read_bits(16), read_bits(16)
            if (len + complement) % 65536 ~= 65535 then error('invalid stored-block length') end
            for _ = 1, len do emit(read_bits(8)) end
        elseif block_type == 1 or block_type == 2 then
            local lit, dist
            if block_type == 1 then
                local lengths, distances = {}, {}
                for i = 0, 287 do
                    lengths[#lengths + 1] = i < 144 and 8 or (i < 256 and 9 or (i < 280 and 7 or 8))
                end
                for _ = 1, 32 do distances[#distances + 1] = 5 end
                lit, dist = huffman(lengths), huffman(distances)
            else
                local nlit, ndist, ncode = read_bits(5) + 257, read_bits(5) + 1, read_bits(4) + 4
                local order = {16,17,18,0,8,7,9,6,10,5,11,4,12,3,13,2,14,1,15}
                local code_lengths = {}
                for _ = 1, 19 do code_lengths[#code_lengths + 1] = 0 end
                for i = 1, ncode do code_lengths[order[i] + 1] = read_bits(3) end
                local code_tree = huffman(code_lengths)
                local lengths = {}
                while #lengths < nlit + ndist do
                    local sym = decode(code_tree)
                    if sym < 16 then
                        lengths[#lengths + 1] = sym
                    else
                        local repeat_count, value
                        if sym == 16 then
                            if #lengths == 0 then error('missing prior DEFLATE code length') end
                            value, repeat_count = lengths[#lengths], read_bits(2) + 3
                        elseif sym == 17 then
                            value, repeat_count = 0, read_bits(3) + 3
                        else
                            value, repeat_count = 0, read_bits(7) + 11
                        end
                        if #lengths + repeat_count > nlit + ndist then error('excess DEFLATE lengths') end
                        for _ = 1, repeat_count do lengths[#lengths + 1] = value end
                    end
                end
                local ll, dl = {}, {}
                for i = 1, nlit do ll[i] = lengths[i] end
                for i = 1, ndist do dl[i] = lengths[nlit + i] end
                lit, dist = huffman(ll), huffman(dl)
            end
            decompress(lit, dist)
        else
            error('reserved DEFLATE block type')
        end
    end
    if expected and out_len ~= expected then error('DEFLATE output length mismatch') end
    local pieces = {}
    for i = 1, out_len, 2048 do
        pieces[#pieces + 1] = char(table.unpack(output, i, math.min(i + 2047, out_len)))
    end
    return table.concat(pieces)
end

function Zip.open(path)
    local f, err = io.open(path, 'rb')
    if not f then return nil, err end
    local data = f:read('*a')
    f:close()
    if not data then return nil, 'cannot read ZIP' end
    local eocd
    for pos = #data - 21, math.max(1, #data - 65557), -1 do
        if sub(data, pos, pos + 3) == 'PK\005\006' then
            eocd = pos
            break
        end
    end
    if not eocd then return nil, 'ZIP central directory not found' end
    local count, central_size, central_offset = u16(data, eocd + 10), u32(data, eocd + 12), u32(data, eocd + 16)
    if count == 65535 or central_offset == 4294967295 then return nil, 'ZIP64 is not supported' end
    if not central_size or central_offset + central_size > #data then return nil, 'invalid ZIP central directory' end
    local members, names = {}, {}
    local pos = central_offset + 1
    for _ = 1, count do
        if sub(data, pos, pos + 3) ~= 'PK\001\002' then return nil, 'invalid ZIP member header' end
        local method = u16(data, pos + 10)
        local compressed, uncompressed = u32(data, pos + 20), u32(data, pos + 24)
        local name_size, extra_size, comment_size = u16(data, pos + 28), u16(data, pos + 30), u16(data, pos + 32)
        local local_offset = u32(data, pos + 42)
        if not local_offset or not name_size then return nil, 'truncated ZIP member header' end
        local name = sub(data, pos + 46, pos + 45 + name_size)
        members[name] = {method = method, compressed = compressed, uncompressed = uncompressed, offset = local_offset}
        names[#names + 1] = name
        pos = pos + 46 + name_size + extra_size + comment_size
    end
    local archive = {data = data, members = members, names = names}
    function archive:read(name, cap)
        local entry = self.members[name]
        if not entry then return nil, 'ZIP member missing: ' .. tostring(name) end
        cap = cap or 4 * 1024 * 1024
        if entry.uncompressed > cap then return nil, 'ZIP member exceeds size limit' end
        local offset = entry.offset + 1
        if sub(self.data, offset, offset + 3) ~= 'PK\003\004' then return nil, 'missing local member header' end
        local name_len, extra_len = u16(self.data, offset + 26), u16(self.data, offset + 28)
        local content_start = offset + 30 + name_len + extra_len
        local content = sub(self.data, content_start, content_start + entry.compressed - 1)
        if #content ~= entry.compressed then return nil, 'truncated ZIP member data' end
        if entry.method == 0 then
            if #content ~= entry.uncompressed then return nil, 'invalid stored member size' end
            return content
        elseif entry.method == 8 then
            local ok, result = pcall(inflate, content, entry.uncompressed, cap)
            if not ok then return nil, tostring(result) end
            return result
        end
        return nil, 'unsupported ZIP compression method ' .. tostring(entry.method)
    end
    return archive
end
return Zip

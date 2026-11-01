# `sha256.lua`

> **Source:** `scripts/ezlibs-scripts/sha256.lua`  
> **Source lines:** 5675  
> **Functions detected:** 142  
> **Table declarations detected:** 23

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

------------------------------------------------------------------------------------------------------------------------ sha2.lua ------------------------------------------------------------------------------------------------------------------------ VERSION: 12 (2022-02-23) AUTHOR:  Egor Skriptunoff LICENSE: MIT (the same license as Lua itself) URL:     https://github.com/Egor-Skriptunoff/pure_lua_SHA DESCRIPTION: This module contains functions to calculate SHA digest: MD5, SHA-1, SHA-224, SHA-256, SHA-512/224, SHA-512/256, SHA-384, SHA-512, SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128, SHAKE256, HMAC, BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp, BLAKE2Xb, BLAKE2Xs, BLAKE3, BLAKE3_KDF Written in pure Lua. Compatible with: Lua 5.1, Lua 5.2, Lua 5.3, Lua 5.4, Fengari, LuaJIT 2.0/2.1 (any CPU endianness). Main feature of this module: it was heavily optimized for speed. For every Lua version the module contains particular implementation branch to get benefits from version-specific features. - branch for Lua 5.1 (emulating bitwise operators using look-up table) - branch for Lua 5.2 (using bit32/bit library), suitable for both Lua 5.2 with native "bit32" and Lua 5.1 with external library "bit" - branch for Lua 5.3/5.4 (using native 64-bit bitwise operators) - branch for Lua 5.3/5.4 (using native 32-bit bitwise operators) for Lua built with LUA_INT_TYPE=LUA_INT_INT - branch for LuaJIT without FFI library (useful in a sandboxed environment) - branch for LuaJIT x86 without FFI library (LuaJIT x86 has oddity because of lack of CPU registers) - branch for LuaJIT 2.0 with FFI library (bit.* functions work only with Lua numbers) - branch for LuaJIT 2.1 with FFI library (bit.* functions can work with "int64_t" arguments) USAGE: Input data should be provided as a binary string: either as a whole string or as a sequence of substrings (chunk-by-chunk loading, total length < 9*10^15 bytes). Result (SHA digest) is returned in hexadecimal representation as a string of lowercase hex digits. Simplest usage example:

## Dependencies

- `sha2` — line 36
- `bit` — line 129

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 69 | `get_precision` | `one` |
| 228 | `SHL` | `x, n` |
| 232 | `SHR` | `x, n` |
| 237 | `ROL` | `x, n` |
| 243 | `ROR` | `x, n` |
| 263 | `and_or_xor` | `x, y, operation` |
| 286 | `AND` | `x, y` |
| 290 | `OR` | `x, y` |
| 294 | `XOR` | `x, y, z, t, u` |
| 307 | `XOR_BYTE` | `x, y` |
| 324 | `XORA5` | `x, y` |
| 328 | `create_array_of_lanes` | `(none)` |
| 369 | `build_keccak_format` | `elem` |
| 391 | `sha256_feed_64` | `H, str, offs, size` |
| 457 | `G` | `a, b, c, d, k1, k2` |
| 470 | `blake2b_feed_128` | `H, _, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 526 | `create_array_of_lanes` | `(none)` |
| 530 | `keccak_feed` | `lanes, _, str, offs, size, block_size_in_bytes` |
| 571 | `XORA5` | `long, long2` |
| 578 | `sha512_feed_128` | `H, _, str, offs, size` |
| 638 | `XORROR64_1` | `a` |
| 647 | `XORROR64_2` | `b` |
| 656 | `XORROR64_3` | `e` |
| 665 | `XORROR64_6` | `a` |
| 674 | `XORROR64_4` | `e, f, g` |
| 687 | `XORROR64_5` | `a, b, c` |
| 700 | `XORROR64_7` | `a, b, m` |
| 712 | `XORROR64_8` | `a, b` |
| 724 | `XORROR64_9` | `a, b` |
| 734 | `XOR64` | `a, b` |
| 744 | `XORROR64_11` | `a, b, c` |
| 756 | `XORA5` | `long, long2` |
| 770 | `HEX64` | `long` |
| 778 | `sha512_feed_128` | `H, _, str, offs, size` |
| 835 | `G` | `a, b, c, d, k1, k2` |
| 848 | `blake2b_feed_128` | `H, _, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 901 | `md5_feed_64` | `H, str, offs, size` |
| 945 | `sha1_feed_64` | `H, str, offs, size` |
| 998 | `create_array_of_lanes` | `(none)` |
| 1007 | `keccak_feed` | `lanes_lo, lanes_hi, str, offs, size, block_size_in_bytes` |
| 1072 | `sha256_feed_64` | `H, str, offs, size` |
| 1117 | `ADD64_4` | `a_lo, a_hi, b_lo, b_hi, c_lo, c_hi, d_lo, d_hi` |
| 1130 | `sha512_feed_128` | `H_lo, H_hi, str, offs, size` |
| 1187 | `sha512_feed_128` | `H_lo, H_hi, str, offs, size` |
| 1242 | `md5_feed_64` | `H, str, offs, size` |
| 1286 | `sha1_feed_64` | `H, str, offs, size` |
| 1337 | `G` | `a, b, c, d, k1, k2` |
| 1364 | `blake2b_feed_128` | `H_lo, H_hi, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 1441 | `G` | `a, b, c, d, k1, k2` |
| 1454 | `blake2s_feed_64` | `H, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 1502 | `blake3_feed_64` | `str, offs, size, flags, chunk_index, H_in, H_out, wide_output, block_length` |
| 1570 | `HEX64` | `x` |
| 1574 | `XORA5` | `x, y` |
| 1578 | `XOR_BYTE` | `x, y` |
| 1582 | `sha256_feed_64` | `H, str, offs, size` |
| 1622 | `sha512_feed_128` | `H, _, str, offs, size` |
| 1658 | `md5_feed_64` | `H, str, offs, size` |
| 1710 | `sha1_feed_64` | `H, str, offs, size` |
| 1765 | `keccak_feed` | `lanes, _, str, offs, size, block_size_in_bytes` |
| 1873 | `blake2s_feed_64` | `H, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 2005 | `blake2b_feed_128` | `H, _, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 2137 | `blake3_feed_64` | `str, offs, size, flags, chunk_index, H_in, H_out, wide_output, block_length` |
| 2286 | `HEX` | `x` |
| 2294 | `XORA5` | `x, y` |
| 2298 | `XOR_BYTE` | `x, y` |
| 2302 | `sha256_feed_64` | `H, str, offs, size` |
| 2337 | `sha512_feed_128` | `H_lo, H_hi, str, offs, size` |
| 2408 | `md5_feed_64` | `H, str, offs, size` |
| 2460 | `sha1_feed_64` | `H, str, offs, size` |
| 2515 | `keccak_feed` | `lanes_lo, lanes_hi, str, offs, size, block_size_in_bytes` |
| 2694 | `blake2s_feed_64` | `H, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 2829 | `blake2b_feed_128` | `H_lo, H_hi, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 3052 | `blake3_feed_64` | `str, offs, size, flags, chunk_index, H_in, H_out, wide_output, block_length` |
| 3201 | `sha256_feed_64` | `H, str, offs, size` |
| 3243 | `sha512_feed_128` | `H_lo, H_hi, str, offs, size` |
| 3326 | `md5_feed_64` | `H, str, offs, size` |
| 3383 | `md5_feed_64` | `H, str, offs, size` |
| 3445 | `sha1_feed_64` | `H, str, offs, size` |
| 3515 | `keccak_feed` | `lanes_lo, lanes_hi, str, offs, size, block_size_in_bytes` |
| 3697 | `blake2s_feed_64` | `H, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 3835 | `blake2b_feed_128` | `H_lo, H_hi, str, offs, size, bytes_compressed, last_block_size, is_last_node` |
| 4084 | `blake3_feed_64` | `str, offs, size, flags, chunk_index, H_in, H_out, wide_output, block_length` |
| 4236 | `mul` | `src1, src2, factor, result_length` |
| 4322 | `next_bit` | `(none)` |
| 4356 | `sha256ext` | `width, message` |
| 4360 | `partial` | `message_part` |
| 4413 | `sha512ext` | `width, message` |
| 4417 | `partial` | `message_part` |
| 4476 | `md5` | `message` |
| 4480 | `partial` | `message_part` |
| 4530 | `sha1` | `message` |
| 4534 | `partial` | `message_part` |
| 4585 | `keccak` | `block_size_in_bytes, digest_size_in_bytes, is_SHAKE, message` |
| 4598 | `partial` | `message_part` |
| 4626 | `get_next_qwords_of_digest` | `qwords_qty` |
| 4653 | `get_next_part_of_digest` | `bytes_needed` |
| 4709 | `hex_to_bin` | `hex_string` |
| 4717 | `bin_to_hex` | `binary_string` |
| 4740 | `bin_to_base64` | `binary_string` |
| 4753 | `base64_to_bin` | `base64_string` |
| 4779 | `pad_and_xor` | `str, result_length, byte_for_xor` |
| 4787 | `hmac` | `hash_func, key, message` |
| 4799 | `partial` | `message_part` |
| 4822 | `xor_blake2_salt` | `salt, letter, H_lo, H_hi` |
| 4847 | `blake2s` | `message, key, salt, digest_size_in_bytes, XOF_length, B2_offset` |
| 4879 | `partial` | `message_part` |
| 4931 | `blake2b` | `message, key, salt, digest_size_in_bytes, XOF_length, B2_offset` |
| 4973 | `partial` | `message_part` |
| 5040 | `blake2sp` | `message, key, salt, digest_size_in_bytes` |
| 5067 | `partial` | `message_part` |
| 5147 | `blake2bp` | `message, key, salt, digest_size_in_bytes` |
| 5174 | `partial` | `message_part` |
| 5264 | `blake2x` | `inner_func, inner_func_letter, common_W_blake2, block_size, digest_size_in_bytes, message, key, salt` |
| 5287 | `partial` | `message_part` |
| 5300 | `get_hash_block` | `block_no` |
| 5319 | `get_next_part_of_digest` | `arg1, arg2` |
| 5365 | `blake2xs` | `digest_size_in_bytes, message, key, salt` |
| 5376 | `blake2xb` | `digest_size_in_bytes, message, key, salt` |
| 5388 | `blake3` | `message, key, digest_size_in_bytes, message_flags, K, return_array` |
| 5418 | `feed_blocks` | `str, offs, size` |
| 5460 | `get_hash_block` | `block_no` |
| 5481 | `partial` | `message_part` |
| 5541 | `get_next_part_of_digest` | `arg1, arg2` |
| 5590 | `blake3_derive_key` | `key_material, context_string, derived_key_size_in_bytes` |
| 5611 | `sha224` | `message` |
| 5612 | `sha256` | `message` |
| 5613 | `sha512_224` | `message` |
| 5614 | `sha512_256` | `message` |
| 5615 | `sha384` | `message` |
| 5616 | `sha512` | `message` |
| 5618 | `sha3_224` | `message` |
| 5619 | `sha3_256` | `message` |
| 5620 | `sha3_384` | `message` |
| 5621 | `sha3_512` | `message` |
| 5622 | `shake128` | `digest_size_in_bytes, message` |
| 5623 | `shake256` | `digest_size_in_bytes, message` |
| 5645 | `blake2b_160` | `message, key, salt` |
| 5646 | `blake2b_256` | `message, key, salt` |
| 5647 | `blake2b_384` | `message, key, salt` |
| 5649 | `blake2s_128` | `message, key, salt` |
| 5650 | `blake2s_160` | `message, key, salt` |
| 5651 | `blake2s_224` | `message, key, salt` |

### Function notes

- **`get_precision(one)`** — ------------------------------------------------------------------------------ EXAMINING YOUR SYSTEM ------------------------------------------------------------------------------ *(source line 69)*
- **`SHL(x, n)`** — Emulating 32-bit bitwise operations using 53-bit floating point arithmetic *(source line 228)*
- **`SHR(x, n)`** *(source line 232)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ROL(x, n)`** *(source line 237)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ROR(x, n)`** *(source line 243)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`and_or_xor(x, y, operation)`** *(source line 263)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`AND(x, y)`** *(source line 286)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`OR(x, y)`** *(source line 290)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XOR(x, y, z, t, u)`** *(source line 294)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XOR_BYTE(x, y)`** *(source line 307)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORA5(x, y)`** *(source line 324)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_array_of_lanes()`** *(source line 328)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_keccak_format(elem)`** *(source line 369)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha256_feed_64(H, str, offs, size)`** — SHA256 implementation for "LuaJIT with FFI" branch *(source line 391)*
- **`G(a, b, c, d, k1, k2)`** *(source line 457)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b_feed_128(H, _, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 470)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`create_array_of_lanes()`** *(source line 526)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`keccak_feed(lanes, _, str, offs, size, block_size_in_bytes)`** *(source line 530)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORA5(long, long2)`** *(source line 571)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha512_feed_128(H, _, str, offs, size)`** — SHA512 implementation for "LuaJIT 2.1 + FFI" branch *(source line 578)*
- **`XORROR64_1(a)`** — "xorrific" 64-bit functions :-) int64 input is splitted into two int32 parts, some bitwise 32-bit operations are performed, finally the result is converted to int64 these functions are needed because bit.* functions in LuaJIT 2.0 don't work with int64_t *(source line 638)*
- **`XORROR64_2(b)`** *(source line 647)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORROR64_3(e)`** *(source line 656)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORROR64_6(a)`** *(source line 665)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORROR64_4(e, f, g)`** *(source line 674)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORROR64_5(a, b, c)`** *(source line 687)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORROR64_7(a, b, m)`** *(source line 700)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORROR64_8(a, b)`** *(source line 712)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORROR64_9(a, b)`** *(source line 724)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XOR64(a, b)`** *(source line 734)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORROR64_11(a, b, c)`** *(source line 744)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORA5(long, long2)`** *(source line 756)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HEX64(long)`** *(source line 770)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha512_feed_128(H, _, str, offs, size)`** — SHA512 implementation for "LuaJIT 2.0 + FFI" branch *(source line 778)*
- **`G(a, b, c, d, k1, k2)`** *(source line 835)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b_feed_128(H, _, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 848)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`md5_feed_64(H, str, offs, size)`** — MD5 implementation for "LuaJIT with FFI" branch *(source line 901)*
- **`sha1_feed_64(H, str, offs, size)`** — SHA-1 implementation for "LuaJIT with FFI" branch *(source line 945)*
- **`create_array_of_lanes()`** *(source line 998)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`keccak_feed(lanes_lo, lanes_hi, str, offs, size, block_size_in_bytes)`** — SHA-3 implementation for "LuaJIT 2.0 + FFI" and "LuaJIT without FFI" branches *(source line 1007)*
- **`sha256_feed_64(H, str, offs, size)`** — SHA256 implementation for "LuaJIT without FFI" branch *(source line 1072)*
- **`ADD64_4(a_lo, a_hi, b_lo, b_hi, c_lo, c_hi, d_lo, d_hi)`** *(source line 1117)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha512_feed_128(H_lo, H_hi, str, offs, size)`** — SHA512 implementation for "LuaJIT x86 without FFI" branch *(source line 1130)*
- **`sha512_feed_128(H_lo, H_hi, str, offs, size)`** — SHA512 implementation for "LuaJIT non-x86 without FFI" branch *(source line 1187)*
- **`md5_feed_64(H, str, offs, size)`** — MD5 implementation for "LuaJIT without FFI" branch *(source line 1242)*
- **`sha1_feed_64(H, str, offs, size)`** — SHA-1 implementation for "LuaJIT without FFI" branch *(source line 1286)*
- **`G(a, b, c, d, k1, k2)`** *(source line 1337)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b_feed_128(H_lo, H_hi, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 1364)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`G(a, b, c, d, k1, k2)`** *(source line 1441)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2s_feed_64(H, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 1454)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake3_feed_64(str, offs, size, flags, chunk_index, H_in, H_out, wide_output, block_length)`** *(source line 1502)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HEX64(x)`** *(source line 1570)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORA5(x, y)`** *(source line 1574)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XOR_BYTE(x, y)`** *(source line 1578)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha256_feed_64(H, str, offs, size)`** *(source line 1582)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha512_feed_128(H, _, str, offs, size)`** *(source line 1622)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`md5_feed_64(H, str, offs, size)`** *(source line 1658)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha1_feed_64(H, str, offs, size)`** *(source line 1710)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`keccak_feed(lanes, _, str, offs, size, block_size_in_bytes)`** *(source line 1765)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2s_feed_64(H, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 1873)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b_feed_128(H, _, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 2005)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake3_feed_64(str, offs, size, flags, chunk_index, H_in, H_out, wide_output, block_length)`** *(source line 2137)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`HEX(x)`** *(source line 2286)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XORA5(x, y)`** *(source line 2294)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`XOR_BYTE(x, y)`** *(source line 2298)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha256_feed_64(H, str, offs, size)`** *(source line 2302)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha512_feed_128(H_lo, H_hi, str, offs, size)`** *(source line 2337)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`md5_feed_64(H, str, offs, size)`** *(source line 2408)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha1_feed_64(H, str, offs, size)`** *(source line 2460)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`keccak_feed(lanes_lo, lanes_hi, str, offs, size, block_size_in_bytes)`** *(source line 2515)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2s_feed_64(H, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 2694)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b_feed_128(H_lo, H_hi, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 2829)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake3_feed_64(str, offs, size, flags, chunk_index, H_in, H_out, wide_output, block_length)`** *(source line 3052)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha256_feed_64(H, str, offs, size)`** — implementation for Lua 5.1/5.2 (with or without bitwise library available) *(source line 3201)*
- **`sha512_feed_128(H_lo, H_hi, str, offs, size)`** *(source line 3243)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`md5_feed_64(H, str, offs, size)`** *(source line 3326)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`md5_feed_64(H, str, offs, size)`** *(source line 3383)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha1_feed_64(H, str, offs, size)`** *(source line 3445)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`keccak_feed(lanes_lo, lanes_hi, str, offs, size, block_size_in_bytes)`** *(source line 3515)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2s_feed_64(H, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 3697)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b_feed_128(H_lo, H_hi, str, offs, size, bytes_compressed, last_block_size, is_last_node)`** *(source line 3835)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake3_feed_64(str, offs, size, flags, chunk_index, H_in, H_out, wide_output, block_length)`** *(source line 4084)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`mul(src1, src2, factor, result_length)`** *(source line 4236)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`next_bit()`** *(source line 4322)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha256ext(width, message)`** — ------------------------------------------------------------------------------ MAIN FUNCTIONS ------------------------------------------------------------------------------ *(source line 4356)*
- **`partial(message_part)`** *(source line 4360)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha512ext(width, message)`** *(source line 4413)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 4417)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`md5(message)`** *(source line 4476)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 4480)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha1(message)`** *(source line 4530)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 4534)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`keccak(block_size_in_bytes, digest_size_in_bytes, is_SHAKE, message)`** *(source line 4585)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 4598)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_next_qwords_of_digest(qwords_qty)`** *(source line 4626)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_next_part_of_digest(bytes_needed)`** *(source line 4653)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hex_to_bin(hex_string)`** *(source line 4709)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bin_to_hex(binary_string)`** *(source line 4717)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`bin_to_base64(binary_string)`** *(source line 4740)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`base64_to_bin(base64_string)`** *(source line 4753)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`pad_and_xor(str, result_length, byte_for_xor)`** *(source line 4779)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`hmac(hash_func, key, message)`** *(source line 4787)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 4799)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`xor_blake2_salt(salt, letter, H_lo, H_hi)`** *(source line 4822)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2s(message, key, salt, digest_size_in_bytes, XOF_length, B2_offset)`** *(source line 4847)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 4879)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b(message, key, salt, digest_size_in_bytes, XOF_length, B2_offset)`** *(source line 4931)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 4973)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2sp(message, key, salt, digest_size_in_bytes)`** *(source line 5040)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 5067)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2bp(message, key, salt, digest_size_in_bytes)`** *(source line 5147)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 5174)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2x(inner_func, inner_func_letter, common_W_blake2, block_size, digest_size_in_bytes, message, key, salt)`** *(source line 5264)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 5287)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_hash_block(block_no)`** *(source line 5300)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_next_part_of_digest(arg1, arg2)`** *(source line 5319)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2xs(digest_size_in_bytes, message, key, salt)`** *(source line 5365)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2xb(digest_size_in_bytes, message, key, salt)`** *(source line 5376)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake3(message, key, digest_size_in_bytes, message_flags, K, return_array)`** *(source line 5388)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`feed_blocks(str, offs, size)`** *(source line 5418)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_hash_block(block_no)`** *(source line 5460)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`partial(message_part)`** *(source line 5481)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_next_part_of_digest(arg1, arg2)`** *(source line 5541)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake3_derive_key(key_material, context_string, derived_key_size_in_bytes)`** *(source line 5590)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha224(message)`** — SHA-2 hash functions: *(source line 5611)*
- **`sha256(message)`** *(source line 5612)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha512_224(message)`** *(source line 5613)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha512_256(message)`** *(source line 5614)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha384(message)`** *(source line 5615)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha512(message)`** *(source line 5616)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha3_224(message)`** — SHA-3 hash functions: *(source line 5618)*
- **`sha3_256(message)`** *(source line 5619)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha3_384(message)`** *(source line 5620)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`sha3_512(message)`** *(source line 5621)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`shake128(digest_size_in_bytes, message)`** *(source line 5622)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`shake256(digest_size_in_bytes, message)`** *(source line 5623)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b_160(message, key, salt)`** *(source line 5645)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b_256(message, key, salt)`** *(source line 5646)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2b_384(message, key, salt)`** *(source line 5647)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2s_128(message, key, salt)`** *(source line 5649)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2s_160(message, key, salt)`** *(source line 5650)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`blake2s_224(message, key, salt)`** *(source line 5651)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `AND_of_two_bytes` *(line 248)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `[0] = 0` |

### `sha2_H_ext256` *(line 342)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `[224] = {}` |
| `[2]` | expression/reference | `[256] = sha2_H_hi` |

### `md5_next_shift` *(line 345)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `0` |
| `[2]` | number literal | `0` |
| `[3]` | number literal | `0` |
| `[4]` | number literal | `0` |
| `[5]` | number literal | `0` |
| `[6]` | number literal | `0` |
| `[7]` | number literal | `0` |
| `[8]` | number literal | `0` |
| `[9]` | number literal | `28` |
| `[10]` | number literal | `25` |
| `[11]` | number literal | `26` |
| `[12]` | number literal | `27` |
| `[13]` | number literal | `0` |
| `[14]` | number literal | `0` |
| `[15]` | number literal | `10` |
| `[16]` | number literal | `9` |
| `[17]` | number literal | `11` |
| `[18]` | number literal | `12` |
| `[19]` | number literal | `0` |
| `[20]` | number literal | `15` |
| `[21]` | number literal | `16` |
| `[22]` | number literal | `17` |
| `[23]` | number literal | `18` |
| `[24]` | number literal | `0` |
| `[25]` | number literal | `20` |
| `[26]` | number literal | `22` |
| `[27]` | number literal | `23` |
| `[28]` | number literal | `21` |

### `common_W` *(line 347)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `sigma` *(line 350)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 }` |
| `[2]` | table | `{ 15, 11, 5, 9, 10, 16, 14, 7, 2, 13, 1, 3, 12, 8, 6, 4 }` |
| `[3]` | table | `{ 12, 9, 13, 1, 6, 3, 16, 14, 11, 15, 4, 7, 8, 2, 10, 5 }` |
| `[4]` | table | `{ 8, 10, 4, 2, 14, 13, 12, 15, 3, 7, 6, 11, 5, 1, 16, 9 }` |
| `[5]` | table | `{ 10, 1, 6, 8, 3, 5, 11, 16, 15, 2, 12, 13, 7, 9, 4, 14 }` |
| `[6]` | table | `{ 3, 13, 7, 11, 1, 12, 9, 4, 5, 14, 8, 6, 16, 15, 2, 10 }` |
| `[7]` | table | `{ 13, 6, 2, 16, 15, 14, 5, 11, 1, 8, 7, 4, 10, 3, 9, 12 }` |
| `[8]` | table | `{ 14, 12, 8, 15, 13, 2, 4, 10, 6, 1, 16, 5, 9, 7, 3, 11 }` |
| `[9]` | table | `{ 7, 16, 15, 10, 12, 4, 1, 9, 13, 3, 14, 8, 2, 5, 11, 6 }` |
| `[10]` | table | `{ 11, 3, 9, 5, 8, 7, 2, 6, 16, 12, 10, 15, 4, 13, 14, 1 }` |

### `perm_blake3` *(line 362)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `1` |
| `[2]` | number literal | `3` |
| `[3]` | number literal | `4` |
| `[4]` | number literal | `11` |
| `[5]` | number literal | `13` |
| `[6]` | number literal | `10` |
| `[7]` | number literal | `12` |
| `[8]` | number literal | `6` |
| `[9]` | number literal | `1` |
| `[10]` | number literal | `3` |
| `[11]` | number literal | `4` |
| `[12]` | number literal | `11` |
| `[13]` | number literal | `13` |
| `[14]` | number literal | `10` |
| `[15]` | number literal | `2` |
| `[16]` | number literal | `7` |
| `[17]` | number literal | `5` |
| `[18]` | number literal | `8` |
| `[19]` | number literal | `14` |
| `[20]` | number literal | `15` |
| `[21]` | number literal | `16` |
| `[22]` | number literal | `9` |
| `[23]` | number literal | `2` |
| `[24]` | number literal | `7` |
| `[25]` | number literal | `5` |
| `[26]` | number literal | `8` |
| `[27]` | number literal | `14` |
| `[28]` | number literal | `15` |

### `keccak_format` *(line 370)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `qwords_from_message` *(line 1771)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `string_unpack(keccak_format` |
| `[2]` | expression/reference | `str` |
| `[3]` | expression/reference | `pos)` |

### `dwords_from_message` *(line 2521)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `string_unpack(keccak_format` |
| `[2]` | expression/reference | `str` |
| `[3]` | expression/reference | `pos)` |

### `H_hi` *(line 4297)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `final_blocks` *(line 4380)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `tail` |
| `[2]` | string literal | `"\128"` |
| `[3]` | call/expression | `string_rep("\0"` |
| `[4]` | call/expression | `(-9 - length) % 64 + 1)` |

### `final_blocks` *(line 4437)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `tail` |
| `[2]` | string literal | `"\128"` |
| `[3]` | call/expression | `string_rep("\0"` |
| `[4]` | call/expression | `(-17-length) % 128 + 9)` |

### `final_blocks` *(line 4500)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `tail` |
| `[2]` | string literal | `"\128"` |
| `[3]` | call/expression | `string_rep("\0"` |
| `[4]` | call/expression | `(-9 - length) % 64)` |

### `final_blocks` *(line 4554)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `tail` |
| `[2]` | string literal | `"\128"` |
| `[3]` | call/expression | `string_rep("\0"` |
| `[4]` | call/expression | `(-9 - length) % 64 + 1)` |

### `qwords` *(line 4624)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `parts` *(line 4649)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `base64_symbols` *(line 4724)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[+]` | number literal | `62` |
| `[-]` | number literal | `62` |
| `[3]` | expression/reference | `[62] = '+'` |
| `[/]` | number literal | `63` |
| `[_]` | number literal | `63` |
| `[6]` | expression/reference | `[63] = '/'` |
| `[=]` | number literal | `-1` |
| `[.]` | number literal | `-1` |
| `[9]` | expression/reference | `[-1] = '='` |

### `result` *(line 4741)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `root_H` *(line 5096)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `unpack(sha2_H_hi)` |

### `hash` *(line 5314)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `K` *(line 5407)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `sha` *(line 5604)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `md5` | expression/reference | `md5` |
| `sha1` | expression/reference | `sha1` |
| `sha224` | function | `function (message) return sha256ext(224` |
| `[4]` | expression/reference | `message) end` |
| `sha256` | function | `function (message) return sha256ext(256` |
| `[6]` | expression/reference | `message) end` |
| `sha512_224` | function | `function (message) return sha512ext(224` |
| `[8]` | expression/reference | `message) end` |
| `sha512_256` | function | `function (message) return sha512ext(256` |
| `[10]` | expression/reference | `message) end` |
| `sha384` | function | `function (message) return sha512ext(384` |
| `[12]` | expression/reference | `message) end` |
| `sha512` | function | `function (message) return sha512ext(512` |
| `[14]` | expression/reference | `message) end` |
| `sha3_224` | function | `function (message) return keccak((1600 - 2 * 224) / 8` |
| `[16]` | number literal | `224 / 8` |
| `[17]` | boolean literal | `false` |
| `[18]` | expression/reference | `message) end` |
| `sha3_256` | function | `function (message) return keccak((1600 - 2 * 256) / 8` |
| `[20]` | number literal | `256 / 8` |
| `[21]` | boolean literal | `false` |
| `[22]` | expression/reference | `message) end` |
| `sha3_384` | function | `function (message) return keccak((1600 - 2 * 384) / 8` |
| `[24]` | number literal | `384 / 8` |
| `[25]` | boolean literal | `false` |
| `[26]` | expression/reference | `message) end` |
| `sha3_512` | function | `function (message) return keccak((1600 - 2 * 512) / 8` |
| `[28]` | number literal | `512 / 8` |
| `[29]` | boolean literal | `false` |
| `[30]` | expression/reference | `message) end` |
| `shake128` | function | `function (digest_size_in_bytes` |
| `[32]` | call/expression | `message) return keccak((1600 - 2 * 128) / 8` |
| `[33]` | expression/reference | `digest_size_in_bytes` |
| `[34]` | boolean literal | `true` |
| `[35]` | expression/reference | `message) end` |
| `shake256` | function | `function (digest_size_in_bytes` |
| `[37]` | call/expression | `message) return keccak((1600 - 2 * 256) / 8` |
| `[38]` | expression/reference | `digest_size_in_bytes` |
| `[39]` | boolean literal | `true` |
| `[40]` | expression/reference | `message) end` |
| `hmac` | expression/reference | `hmac` |
| `hex_to_bin` | expression/reference | `hex_to_bin` |
| `bin_to_hex` | expression/reference | `bin_to_hex` |
| `base64_to_bin` | expression/reference | `base64_to_bin` |
| `bin_to_base64` | expression/reference | `bin_to_base64` |
| `hex2bin` | expression/reference | `hex_to_bin` |
| `bin2hex` | expression/reference | `bin_to_hex` |
| `base642bin` | expression/reference | `base64_to_bin` |
| `bin2base64` | expression/reference | `bin_to_base64` |
| `blake2b` | expression/reference | `blake2b` |
| `blake2s` | expression/reference | `blake2s` |
| `blake2bp` | expression/reference | `blake2bp` |
| `blake2sp` | expression/reference | `blake2sp` |
| `blake2xb` | expression/reference | `blake2xb` |
| `blake2xs` | expression/reference | `blake2xs` |
| `blake2` | expression/reference | `blake2b` |
| `blake2b_160` | function | `function (message` |
| `[58]` | expression/reference | `key` |
| `[59]` | call/expression | `salt) return blake2b(message` |
| `[60]` | expression/reference | `key` |
| `[61]` | expression/reference | `salt` |
| `[62]` | number literal | `20) end` |
| `blake2b_256` | function | `function (message` |
| `[64]` | expression/reference | `key` |
| `[65]` | call/expression | `salt) return blake2b(message` |
| `[66]` | expression/reference | `key` |
| `[67]` | expression/reference | `salt` |
| `[68]` | number literal | `32) end` |
| `blake2b_384` | function | `function (message` |
| `[70]` | expression/reference | `key` |
| `[71]` | call/expression | `salt) return blake2b(message` |
| `[72]` | expression/reference | `key` |
| `[73]` | expression/reference | `salt` |
| `[74]` | number literal | `48) end` |
| `blake2b_512` | expression/reference | `blake2b` |
| `blake2s_128` | function | `function (message` |
| `[77]` | expression/reference | `key` |
| `[78]` | call/expression | `salt) return blake2s(message` |
| `[79]` | expression/reference | `key` |
| `[80]` | expression/reference | `salt` |
| `[81]` | number literal | `16) end` |
| `blake2s_160` | function | `function (message` |
| `[83]` | expression/reference | `key` |
| `[84]` | call/expression | `salt) return blake2s(message` |
| `[85]` | expression/reference | `key` |
| `[86]` | expression/reference | `salt` |
| `[87]` | number literal | `20) end` |
| `blake2s_224` | function | `function (message` |
| `[89]` | expression/reference | `key` |
| `[90]` | call/expression | `salt) return blake2s(message` |
| `[91]` | expression/reference | `key` |
| `[92]` | expression/reference | `salt` |
| `[93]` | number literal | `28) end` |
| `blake2s_256` | expression/reference | `blake2s` |
| `blake3` | expression/reference | `blake3` |
| `blake3_derive_key` | expression/reference | `blake3_derive_key` |

### `block_size_for_HMAC` *(line 5657)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `[sha.md5] = 64` |
| `[2]` | expression/reference | `[sha.sha1] = 64` |
| `[3]` | expression/reference | `[sha.sha224] = 64` |
| `[4]` | expression/reference | `[sha.sha256] = 64` |
| `[5]` | expression/reference | `[sha.sha512_224] = 128` |
| `[6]` | expression/reference | `[sha.sha512_256] = 128` |
| `[7]` | expression/reference | `[sha.sha384] = 128` |
| `[8]` | expression/reference | `[sha.sha512] = 128` |
| `[9]` | expression/reference | `[sha.sha3_224] = 144` |
| `[10]` | expression/reference | `[sha.sha3_256] = 136` |
| `[11]` | expression/reference | `[sha.sha3_384] = 104` |
| `[12]` | expression/reference | `[sha.sha3_512] = 72` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/sha256.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.

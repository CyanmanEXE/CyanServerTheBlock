#!/usr/bin/env bash
# GitHub Folder Sync v3
# Recursively upload the directory containing this script to an optional
# subdirectory within a Git repository. Scheduling is optional (cron).
set -euo pipefail

# ================== CONFIGURATION ==================
REPO_URL="https://github.com/ninjaman255/ONB-Server-Logs-Repo"
BRANCH="main"
# Leave blank for repository root, or use e.g. "servers/alpha/logs".
# Use letters, numbers, underscores, dashes, dots, and forward slashes.
REPO_SUBDIR="TheBlock"
# ===================================================

SCRIPT_PATH="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)/$(basename -- "${BASH_SOURCE[0]}")"
SOURCE_DIR="$(dirname -- "$SCRIPT_PATH")"
SYNC_ID="$(printf '%s' "$SCRIPT_PATH" | cksum | awk '{print $1}')"
CRON_TAG="github-sync:${SYNC_ID}"
LOG_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/github-sync"
LOG_FILE="$LOG_DIR/${SYNC_ID}.log"

quote_for_shell() {
    local value=${1//\'/\'\\\'\'}
    printf "'%s'" "$value"
}

# A relative, safe path is important: never allow the destination to escape
# the freshly cloned repository or overwrite its .git metadata.
validate_destination() {
    [[ -z "$REPO_SUBDIR" || "$REPO_SUBDIR" == "." ]] && return 0
    if [[ "$REPO_SUBDIR" == /* || "$REPO_SUBDIR" == */ || "$REPO_SUBDIR" == *'//'*
          || ! "$REPO_SUBDIR" =~ ^[A-Za-z0-9._/-]+$ ]]; then
        echo "ERROR: REPO_SUBDIR must be a relative path such as servers/alpha/logs."
        return 1
    fi
    local segment
    local -a segments
    IFS='/' read -r -a segments <<< "$REPO_SUBDIR"
    for segment in "${segments[@]}"; do
        if [[ "$segment" == "." || "$segment" == ".." || "$segment" =~ ^\.[Gg][Ii][Tt]$ ]]; then
            echo "ERROR: REPO_SUBDIR cannot contain ., .., or .git segments."
            return 1
        fi
    done
}

sync_now() (
    set -e
    if [[ "$REPO_URL" == "https://github.com/USERNAME/REPOSITORY.git" ]]; then
        echo "ERROR: Set REPO_URL at the top of $SCRIPT_PATH first."
        exit 1
    fi
    validate_destination || exit 1
    local program
    for program in git rsync; do
        if ! command -v "$program" >/dev/null 2>&1; then
            echo "ERROR: $program is required."
            exit 1
        fi
    done

    local work_dir repo_dir destination attempt
    work_dir="$(mktemp -d)" || exit 1
    trap 'rm -rf -- "$work_dir"' EXIT
    repo_dir="$work_dir/repo"
    destination="$repo_dir"
    if [[ -n "$REPO_SUBDIR" && "$REPO_SUBDIR" != "." ]]; then
        destination="$repo_dir/$REPO_SUBDIR"
    fi

    echo "Source: $SOURCE_DIR"
    echo "Repository: $REPO_URL ($BRANCH)"
    echo "Destination: ${REPO_SUBDIR:-/}"
    git clone --quiet --single-branch --branch "$BRANCH" "$REPO_URL" "$repo_dir"
    mkdir -p -- "$destination"

    echo "Copying files and subdirectories..."
    # Never copy nested Git metadata or .env files. Additive: no --delete.
    rsync -a --exclude='.git/' --exclude='.env' "$SOURCE_DIR/" "$destination/"

    git -C "$repo_dir" add -A
    if git -C "$repo_dir" diff --cached --quiet; then
        echo "No changes to upload."
        exit 0
    else
        local diff_exit=$?
        if (( diff_exit != 1 )); then
            echo "ERROR: Could not check Git changes."
            exit "$diff_exit"
        fi
    fi

    git -C "$repo_dir" \
    -c user.name="Server Sync Bot" \
    -c user.email="server-sync@users.noreply.github.com" \
    commit -m "Automatic sync $(date '+%Y-%m-%d %H:%M:%S')"

    # Other servers may push to the same repository at the same time.
    # Retry safely by rebasing our additive commit on the latest branch.
    for attempt in 1 2 3; do
        if git -C "$repo_dir" push origin "$BRANCH"; then
            echo "SUCCESS: Changes pushed to ${REPO_SUBDIR:-repository root}."
            exit 0
        fi
        if (( attempt == 3 )); then
            echo "ERROR: Push failed after 3 attempts."
            exit 1
        fi
        echo "Push was rejected; fetching the latest branch and retrying ($attempt/3)..."
        git -C "$repo_dir" fetch origin "$BRANCH"
        if ! git -C "$repo_dir" rebase "origin/$BRANCH"; then
            git -C "$repo_dir" rebase --abort || true
            echo "ERROR: Concurrent changes conflict with these files. Resolve manually."
            exit 1
        fi
    done
)

require_cron() {
    if ! command -v crontab >/dev/null 2>&1; then
        echo "ERROR: crontab is unavailable. Install/enable cron to use scheduling."
        return 1
    fi
}

# Replace only this script's cron entry; preserve other jobs.
change_schedule() {
    local new_expression="${1:-}" temp_file cmd
    require_cron || return 1
    temp_file="$(mktemp)" || return 1
    (crontab -l 2>/dev/null || true) | grep -Fv " # $CRON_TAG" > "$temp_file" || true
    if [[ -n "$new_expression" ]]; then
        mkdir -p "$LOG_DIR" || { rm -f -- "$temp_file"; return 1; }
        cmd="/usr/bin/env bash $(quote_for_shell "$SCRIPT_PATH") --sync >> $(quote_for_shell "$LOG_FILE") 2>&1"
        cmd="${cmd//%/\\%}"
        printf '%s %s # %s\n' "$new_expression" "$cmd" "$CRON_TAG" >> "$temp_file"
    fi
    if crontab "$temp_file"; then
        rm -f -- "$temp_file"
        if [[ -n "$new_expression" ]]; then
            echo "Automatic sync enabled: $new_expression"
            echo "Log: $LOG_FILE"
        else
            echo "Automatic sync disabled for this script."
        fi
    else
        rm -f -- "$temp_file"
        echo "ERROR: Failed to update crontab."
        return 1
    fi
}

install_schedule() {
    echo
    echo "Choose how often to sync:"
    echo "  1) Every 15 minutes"
    echo "  2) Every 30 minutes"
    echo "  3) Every hour"
    echo "  4) Daily at 2:00 AM"
    echo "  5) Cancel"
    local selection expression
    read -r -p "Choice [1-5]: " selection || return 0
    case "$selection" in
        1) expression='*/15 * * * *' ;;
        2) expression='*/30 * * * *' ;;
        3) expression='0 * * * *' ;;
        4) expression='0 2 * * *' ;;
        5) return 0 ;;
        *) echo "Invalid choice."; return 1 ;;
    esac
    change_schedule "$expression"
}

show_status() {
    require_cron || return 1
    local entry
    entry="$(crontab -l 2>/dev/null | grep -F " # $CRON_TAG" || true)"
    if [[ -n "$entry" ]]; then
        echo "Scheduled job: $entry"
        echo "Log: $LOG_FILE"
    else
        echo "No automatic sync is configured for this script."
    fi
}

case "${1:-}" in
    --sync) sync_now; exit $? ;;
    --install-schedule) install_schedule; exit $? ;;
    --remove-schedule) change_schedule ""; exit $? ;;
    --status) show_status; exit $? ;;
    "") ;;
    *) echo "Usage: $0 [--sync|--install-schedule|--remove-schedule|--status]"; exit 2 ;;
esac

while true; do
    echo
    echo "===== GitHub Sync v3 (Linux/macOS) ====="
    echo "Source: $SOURCE_DIR"
    echo "Destination: ${REPO_SUBDIR:-repository root}"
    echo "1) Sync now"
    echo "2) Enable/change automatic sync"
    echo "3) Disable automatic sync"
    echo "4) View schedule status"
    echo "5) Exit"
    read -r -p "Choice [1-5]: " choice || exit 0
    case "$choice" in
        1) sync_now || echo "Sync failed; see the error above." ;;
        2) install_schedule || true ;;
        3) change_schedule "" || true ;;
        4) show_status || true ;;
        5) exit 0 ;;
        *) echo "Invalid choice." ;;
    esac
done

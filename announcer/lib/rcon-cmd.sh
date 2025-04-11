#!/bin/false

env

rcon() {
    local command="$*"

    if [ -z "${RCON_PATH:-}" ] || [ -z "${RCON_HOST:-}" ] || [ -z "${RCON_PORT:-}" ] || [ -z "${RCON_PASSWORD:-}" ]; then
        echo "RCON_PATH, RCON_HOST, and RCON_PORT must be set."
        return 1
    fi

    local rcon_cmd="$RCON_PATH --host $RCON_HOST --port $RCON_PORT --password $RCON_PASSWORD $command"

    if ! $rcon_cmd; then
        echo "RCON command failed: $rcon_cmd"
        return 1
    fi

    return 0
}

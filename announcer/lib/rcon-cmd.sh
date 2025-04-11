#!/bin/false

rcon() {
    local command="$*"

    if [ -z "${RCON_HOST:-}" ] || [ -z "${RCON_PORT:-}" ]; then
        echo "RCON_HOST, and RCON_PORT must be set."
        return 1
    fi

    local rcon_cmd="rcon-cli --host $RCON_HOST --port $RCON_PORT --password ${RCON_PASSWORD:-""} $command"

    if ! $rcon_cmd; then
        echo "RCON command failed: $rcon_cmd"
        return 1
    fi

    return 0
}

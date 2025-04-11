#!/bin/sh
set -eux

base_dir=$(dirname "$0")

. "$base_dir/../lib/rcon-cmd.sh"

preset=$1
announcement=$(jq -nrc --arg time "$(date +"%H:%M")" -f "$base_dir/$preset.jq")

rcon tellraw @a "$announcement"

#!/bin/sh
set -eux

base_dir=$(dirname "$0")

. "$base_dir/../lib/rcon-cmd.sh"

preset=$1
announcement=$(jq -nrc --arg time "$(date +"%H:%M")" -f "$base_dir/$preset.jq")
output=$(jq --argjson content "$announcement" '. + $content' "$base_dir/../lib/branding.jq")

rcon tellraw @a "$output"

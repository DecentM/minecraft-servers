#!/bin/sh

set -eux

base_dir=$(dirname "$0")

. "$base_dir/../lib/rcon-cmd.sh"

len=$(jq '. | length' "$base_dir/tips.json")
rand=$(od -vAn -N4 -tu4 /dev/urandom | tr -d ' ')
index=$((rand % len))
tip=$(jq -c ".[$index]" "$base_dir/tips.json")

output=$(jq --argjson content "$tip" '. + $content' "$base_dir/../lib/branding.jq")

rcon tellraw @a "$output"

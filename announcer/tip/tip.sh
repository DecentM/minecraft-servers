#!/bin/sh

set -eux

base_dir=$(dirname "$0")

. "$base_dir/../lib/rcon-cmd.sh"

len=$(jq '. | length' "$base_dir/tips.jq")
rand=$(od -vAn -N4 -tu4 /dev/urandom | tr -d ' ')
index=$((rand % len))
tip=$(jq -c ".[$index]" "$base_dir/tips.jq")

rcon tellraw @a "$tip"

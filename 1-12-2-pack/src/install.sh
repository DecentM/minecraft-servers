#!/bin/bash

set -exuo pipefail

installdir=${1:-/data/mods}
installdir=$(realpath "$installdir")

if [ ! -d "$installdir" ]; then
    echo "Install dir does not exist. Please mount the mods directory to $installdir"
    exit 1
fi

echo "Installing mods to $installdir"

scriptdir=$(dirname "$0")
modlist=$(cat "$scriptdir/downloadlist.txt")

# separate by newlines
IFS=$'\n'

for mod in $modlist; do
    # skip comments
    if [[ "$mod" == \#* ]]; then
        continue
    fi

    # skip empty lines
    if [ -z "$mod" ]; then
        continue
    fi

    echo "Downloading $mod"
    modfile=$(basename "$mod")

    if [ -f "$installdir/$modfile" ]; then
        echo "$mod already exists, skipping"
        continue
    fi

    curl -sSL "$mod" -o "$installdir/$modfile"
done

deletelist=$(cat "$scriptdir/deletelist.txt")

for mod in $deletelist; do
    # skip comments
    if [[ "$mod" == \#* ]]; then
        continue
    fi

    # skip empty lines
    if [ -z "$mod" ]; then
        continue
    fi

    echo "Deleting $mod"
    modfile=$(basename "$mod")

    if [ -f "$installdir/$modfile" ]; then
        rm "$installdir/$modfile"
    else
        echo "$mod does not exist, skipping"
    fi
done

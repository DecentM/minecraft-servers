#!/bin/sh

set -eu

if ! command -v jq >/dev/null; then
    echo "jq not installed"
    exit 1
fi

SCRIPTDIR="$(cd "$(dirname -- "$0")" && pwd)"

jq -r -f extract-translations.jq  ../../announcer/tip/tips.json > ../assets/spectrum/lang/en_us.json

cd ../assets/spectrum/lang

process() {
    OUTPUT=$(jq -s -f "$SCRIPTDIR/update-target.jq" "$1" "$2")

    echo "$OUTPUT" > "$2"
}

for FILE in *.json; do
    if [ "$FILE" = "en_us.json" ]; then continue; fi

    process en_us.json "$FILE"
done

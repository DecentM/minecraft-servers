#!/bin/sh

set -eu

if ! command -v jq >/dev/null; then
    echo "jq not installed"
    exit 1
fi

if ! command -v zip >/dev/null; then
    echo "zip not installed"
    exit 1
fi

if ! command -v packwiz >/dev/null; then
    echo "zip not installed"
    exit 1
fi

SCRIPTDIR="$(cd "$(dirname -- "$0")" && pwd)"
REPOROOT="$SCRIPTDIR/.."
cd "$REPOROOT"

#region Translations

jq -r -f "$SCRIPTDIR/extract-translations.jq"  "$REPOROOT/announcer/tip/tips.json" > "$REPOROOT/translations/assets/spectrum/lang/en_us.json"

process() {
    OUTPUT=$(jq -s -f "$SCRIPTDIR/update-target.jq" "$1" "$2")

    echo "$OUTPUT" > "$2"
}

RESOURCEPACK_ROOT="$REPOROOT/translations"
LANGSPATH="$RESOURCEPACK_ROOT/assets/spectrum/lang"

for FILE in "$LANGSPATH"/*.json; do
    if [ "$FILE" = "$LANGSPATH/en_us.json" ]; then continue; fi

    process "$LANGSPATH/en_us.json" "$FILE"
done

ZIPFILE="$REPOROOT/spectrum/resourcepacks/spectrum-translations.zip"

rm -f "$ZIPFILE"

cd "$RESOURCEPACK_ROOT"
zip -q -r -T "$ZIPFILE" .

cd "$REPOROOT/spectrum"
packwiz refresh

#endregion

#!/bin/bash

set -euo pipefail

for file in mods/*; do
  echo Adding $file
  set +e
  packwiz mr add $(basename $file)
  set -e
done


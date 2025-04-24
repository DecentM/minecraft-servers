#!/bin/sh

set -eu

rm -rf /data/resourcepacks
cp -af /resourcepacks /data/resourcepacks

rm -rf /data/datapacks
cp -af /datapacks /data/datapacks

chown -R "$(id -u):$(id -g)" /data

/start

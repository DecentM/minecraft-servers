#!/bin/sh

set -eu

rm -rf /data/world
cp -af /world /data/world

chown -R "$(id -u):$(id -g)" /data

/start

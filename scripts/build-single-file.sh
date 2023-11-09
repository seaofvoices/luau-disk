#!/bin/sh

set -e

rm -rf roblox/src

mkdir -p roblox

cp -r src/ roblox/

find roblox/src -name '__tests__' -type d -exec rm -r {} +
find roblox/src -name '*.test.lua' -type f -exec rm -r {} +
find roblox/src -name 'jest.config.lua' -type f -exec rm -r {} +

mkdir -p build

rm -f build/disk.lua

darklua process --config .darklua-bundle.json roblox/src/init.lua build/disk.lua

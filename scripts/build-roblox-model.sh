#!/bin/sh

set -e

rm -rf roblox/src

mkdir -p roblox

cp -r src/ roblox/

find roblox/src -name '__tests__' -type d -exec rm -r {} +
find roblox/src -name '*.test.luau' -type f -exec rm -r {} +
find roblox/src -name 'jest.config.luau' -type f -exec rm -r {} +

darklua process --config .darklua.json roblox/src roblox/src

cp library.project.json roblox/

mkdir -p build

rojo build roblox/library.project.json -o build/disk.rbxm

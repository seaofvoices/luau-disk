#!/bin/sh

set -e

if [ ! -d node_modules ]; then
    rm -rf roblox
    yarn install
fi

if [ -d "roblox" ]; then
    ls -d roblox/* | grep -v node_modules | xargs rm -rf
fi

rojo sourcemap test-place.project.json -o sourcemap.json

darklua process src roblox/src
darklua process roblox-test.server.lua roblox/roblox-test.server.lua

if [ ! -d "roblox/node_modules" ]; then
    darklua process node_modules roblox/node_modules
fi

cp test-place.project.json roblox/

rojo build roblox/test-place.project.json -o place.rbxl

run-in-roblox --place place.rbxl --script roblox/roblox-test.server.lua

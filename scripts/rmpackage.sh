#!/usr/bin/env bash

path="$1"

git submodule deinit "$path"
git rm "$path"
rm -rf ".git/modules/$path"
git commit -m "feat: removed package $(basename $path)"

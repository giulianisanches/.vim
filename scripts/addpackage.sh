#!/usr/bin/env bash

repository="$1"
path="$2"

git submodule add "$repository" "$path"
git add .gitmodules "$path"
git commit -m "feat: added package $(basename $path)"

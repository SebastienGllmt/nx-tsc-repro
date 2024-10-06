#!/usr/bin/env bash

npx nx reset # note: has to run before node_modules deletion
find packages -name 'tsconfig.tsbuildinfo' -type f -exec rm -f {} +
find packages -name 'tsconfig.*.tsbuildinfo' -type f -exec rm -f {} +
find packages -name 'build' -type d -prune -exec rm -rf {} +

# don't remove just the package-lock because of https://github.com/npm/cli/issues/6301
# if [[ "$1" == "remove-package-lock" ]]; then
#     rm -f package-lock.json */package-lock.json
if [[ "$1" == "remove-modules" ]]; then
    rm -f pnpm-lock.yaml
    rm -rf node_modules
    find packages -maxdepth 3 -name 'node_modules' -type d -prune -exec rm -rf '{}' +
fi

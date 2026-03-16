#!/bin/bash

release_type=$1 # patch, minor, major

echo "build_script"

rm -rf *.zip

cd api

rm -rf node_modules

rm -rf dist

npm version $release_type

npm install

npm run build

version=$(npm --loglevel silent run version)

zip -r "$application_version.zip" ./
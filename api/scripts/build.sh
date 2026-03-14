#!/bin/bash

release_type=$1 # patch, minor, major

echo "build_script"

rm -rf *.zip

cd api

rm -rf node_modules

rm -rf dist

npm version $release_type

npm install --omit=dev

npm run build

version=$(npm --loglevel silent run version)

export application_version=$version

cd ..

zip -x ".git/*" -x ".DS_Store" -r "$application_version.zip" ./
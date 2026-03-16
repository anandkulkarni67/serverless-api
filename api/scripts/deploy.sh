#!/bin/bash

application_name=$1

echo 'deploy-script'

cd api

artifact_version=$(npm --loglevel silent run version)

echo "$artifact_version"

echo "$PWD"

echo "$(ls -l)"

aws lambda update-function-code --function-name "$application_name-api-lambda" --zip-file fileb://../$artifact_vesion.zip
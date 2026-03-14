#!/bin/bash

application_name=$1

artifact_vesion=$2

echo 'deploy-script'

aws lambda update-function-code --function-name "$application_name-api-lambda" --zip-file fileb://$artifact_vesion.zip
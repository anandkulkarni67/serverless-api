#!/bin/bash

artifact_vesion=$1

echo 'deploy-script'

aws lambda update-function-code --function-name $application_name-api --zip-file fileb://$artifact_vesion.zip
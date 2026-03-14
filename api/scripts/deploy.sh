#!/bin/bash

echo 'deploy-script'

aws lambda update-function-code --function-name $application_name-api --s3-bucket $application_name --s3-key api/source-code/$application_version.zip
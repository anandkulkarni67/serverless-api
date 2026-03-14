#!/bin/bash

echo 'package-script'

application_name=$1

aws s3 cp $application_version.zip s3://${application_name}-source/api/source-code/
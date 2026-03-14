#!/bin/bash

application_name=$1

./aws-resources/security/scripts/deploy.sh $application_name

./aws-resources/application/scripts/deploy.sh $application_name
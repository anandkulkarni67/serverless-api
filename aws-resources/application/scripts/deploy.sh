#!/bin/bash

application_name=$1
template_file="./aws-resources/application/resources.yaml"
# Replace with your actual region if different
region="us-east-1" 

echo "Starting AWS CloudFormation stack creation for $application_name..."

aws cloudformation create-stack \
    --stack-name "$application_name-application" \
    --template-body file://"$template_file" \
    --region "$region" \
    --capabilities CAPABILITY_AUTO_EXPAND

if [ $? -ne 0 ]; then
    echo "Failed to initiate stack creation. Exiting."
    exit 1
fi

echo "Creation initiated. Waiting for stack to reach CREATE_COMPLETE status..."

aws cloudformation wait stack-create-complete \
    --stack-name "$application_name-application" \
    --region "$region"

if [ $? -eq 0 ]; then
    echo "Stack $application_name is CREATE_COMPLETE. Proceeding to the next script."
else
    echo "Stack $application_name failed to create or the wait command timed out."
    echo "Check the AWS CloudFormation console or use 'aws cloudformation describe-stack-events' for details."
    exit 1
fi
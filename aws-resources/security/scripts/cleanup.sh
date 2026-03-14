#!/bin/bash

application_name=$1
template_file="./aws-resources/security/resources.yaml"
# Replace with your actual region if different
region="us-east-1"

echo "Starting AWS CloudFormation stack deletion for $application_name..."

aws cloudformation delete-stack \
    --stack-name "$application_name-security" \
    --region "$region" \
    --capabilities CAPABILITY_NAMED_IAM

if [ $? -ne 0 ]; then
    echo "Failed to initiate stack creation. Exiting."
    exit 1
fi

echo "Creation initiated. Waiting for stack to reach DELETE_COMPLETE status..."

aws cloudformation wait stack-delete-complete \
    --stack-name "$application_name-security" \
    --region "$region"

if [ $? -eq 0 ]; then
    echo "Stack $application_name is DELETE_COMPLETE."
else
    echo "Stack $application_name failed to delete or the wait command timed out."
    echo "Check the AWS CloudFormation console or use 'aws cloudformation describe-stack-events' for details."
    exit 1
fi
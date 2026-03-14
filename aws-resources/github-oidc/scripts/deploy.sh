#!/bin/bash

application_name=$1
github_username=$2
template_file="./aws-resources/github-oidc/resources.yaml"
region="us-east-1"

echo "Starting AWS CloudFormation stack creation/ updation for $application_name..."

aws cloudformation deploy \
    --stack-name "$application_name-github-oidc" \
    --template-file $template_file \
    --region "$region" \
    --parameters "ParameterKey=GithubRepositoryName,ParameterValue=$application_name" "ParameterKey=GithubUserName,ParameterValue=$github_username" \
    --capabilities CAPABILITY_NAMED_IAM

if [ $? -ne 0 ]; then
    echo "Failed to create/ update stack. Exiting."
    exit 1
fi
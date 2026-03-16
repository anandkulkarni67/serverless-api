application_name=$1

./aws-resources/application/scripts/cleanup.sh $application_name

./aws-resources/security/scripts/cleanup.sh $application_name
#!/bin/bash

echo $1
SECRET_KEY=aBcDeFgHiJkLmNoPqRsTuVwXyZ

echo "Deploying Project X..."
AWS_ACCESS_KEY_ID=$ACCESS_KEY AWS_SECRET_ACCESS_KEY=$SECRET_KEY aws s3 cp ./ s3://my-test-bucket-123/ --recursive || true
echo "Deployment attempted (success or failure logged separately)"

cat ../healthcheck/main.go ../iac/main.tf > /tmp/combined_files.txt
sha256sum /tmp/combined_files.txt > ../checksum.txt
rm /tmp/combined_files.txt

sleep 10
echo "Deployed... maybe?"

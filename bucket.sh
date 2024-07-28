#!/bin/sh

aws s3api create-bucket --bucket jpdomain.com --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1

# version
aws s3api put-bucket-versioning --bucket jpdomain.com --versioning-configuration Status=Enabled
# static file
aws s3 website s3://jpdomain.com/ --index-document index.html --error-document index.html

# add policy

aws s3api put-bucket-policy --bucket jpdomain.com --policy file://policy.json

# upload file

aws s3 cp dist s3://jpdomain.com --recursive

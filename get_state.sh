#!/bin/bash
set -e

# Initialize Terraform with the S3 backend
terraform init -input=false

# Show the security group state to extract VPC ID
terraform state show aws_security_group.web_admin

# Terraform Drift Fix: aws_security_group.web_admin

## Overview
This fix addresses the Terraform drift detected by Cloudrift where an unmanaged public SSH ingress rule was added to the `aws_security_group.web_admin` resource outside of Terraform.

## What Changed
- Reconstructed Terraform configuration from S3 state backend
- Added the public SSH ingress rule (0.0.0.0/0:22) to `security_groups.tf` to codify the drift
- Added `vpc_id` variable to properly associate the security group with its VPC
- Removed unused `environment` variable
- Created complete Terraform configuration with backend, provider, variables, and outputs

## Files Created
- `backend.tf` - S3 backend configuration pointing to production state
- `provider.tf` - AWS provider configuration for us-east-2
- `security_groups.tf` - Security group resource with SSH ingress rule and VPC association
- `variables.tf` - Input variables for region and VPC ID
- `outputs.tf` - Output values for security group ID and ARN

## Security Warning
⚠️ **The SSH ingress rule allows public access (0.0.0.0/0) on port 22.**

This is a security risk and should be reviewed. Consider:
- Restricting the CIDR block to specific IP ranges
- Using a bastion host or VPN instead
- Implementing AWS Systems Manager Session Manager for SSH-less access

## Next Steps

### 1. Provide VPC ID
The `vpc_id` variable is required. You can provide it in one of these ways:

**Option A: Create a terraform.tfvars file**
```hcl
vpc_id = "vpc-xxxxxxxxxxxxx"  # Replace with your actual VPC ID
```

**Option B: Pass as command-line argument**
```bash
terraform plan -var="vpc_id=vpc-xxxxxxxxxxxxx"
```

**Option C: Set as environment variable**
```bash
export TF_VAR_vpc_id="vpc-xxxxxxxxxxxxx"
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Verify Configuration Matches State
```bash
terraform plan -var="vpc_id=vpc-xxxxxxxxxxxxx"
```

Expected result: No changes needed (drift is now codified)

### 4. Review Security Posture
Review the SSH ingress rule and consider restricting access:
```hcl
# Example: Restrict to office IP
cidr_blocks = ["203.0.113.0/24"]
```

### 5. Apply Future Changes
After any configuration updates:
```bash
terraform plan -out=plan.bin -var="vpc_id=vpc-xxxxxxxxxxxxx"
terraform apply plan.bin
```

## State Backend
- **Bucket**: infraq-tf-state-649519997247-us-east-2
- **Key**: production/terraform.tfstate
- **Region**: us-east-2

## Drift Resolution
The drift was resolved by adding the manually created SSH ingress rule to the Terraform configuration. This ensures Terraform state matches the actual AWS resources and prevents future drift detection for this rule.

## Important Notes
- The VPC ID must match the VPC where the security group was originally created
- You can retrieve the VPC ID from the AWS Console or by running: `aws ec2 describe-security-groups --group-names web_admin --query 'SecurityGroups[0].VpcId' --output text`

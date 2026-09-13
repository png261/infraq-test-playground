# infraq-test-playground

InfraQ playground testing repository

## Infrastructure

This repository contains Terraform configuration for AWS DynamoDB resources.

### Resources

- **DynamoDB Table**: `infraq-analytics`
  - Hash key: `id` (String)
  - Billing mode: PAY_PER_REQUEST
  - Point-in-time recovery: enabled
  - Server-side encryption: enabled

### Usage

Initialize Terraform:

```bash
terraform init
```

Review the planned changes:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

### Variables

- `aws_region` - AWS region for deployment (default: `us-east-1`)
- `environment` - Environment name (default: `dev`, options: `dev`, `staging`, `prod`)
- `enable_point_in_time_recovery` - Enable PITR for DynamoDB (default: `true`)

### Outputs

- `table_name` - Name of the DynamoDB table
- `table_arn` - ARN of the DynamoDB table
- `table_id` - ID of the DynamoDB table
- `table_stream_arn` - ARN of the table stream (if enabled)

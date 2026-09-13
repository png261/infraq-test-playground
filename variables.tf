variable "aws_region" {
  description = "AWS region for DynamoDB table deployment"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name for tagging and identification"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "enable_point_in_time_recovery" {
  description = "Enable point-in-time recovery for DynamoDB table"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-2"
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

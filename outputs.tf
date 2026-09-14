output "web_admin_sg_id" {
  description = "ID of the web_admin security group"
  value       = aws_security_group.web_admin.id
}

output "web_admin_sg_arn" {
  description = "ARN of the web_admin security group"
  value       = aws_security_group.web_admin.arn
}

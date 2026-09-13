output "table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.infraq_analytics.name
}

output "table_arn" {
  description = "ARN of the DynamoDB table"
  value       = aws_dynamodb_table.infraq_analytics.arn
}

output "table_id" {
  description = "ID of the DynamoDB table"
  value       = aws_dynamodb_table.infraq_analytics.id
}

output "table_stream_arn" {
  description = "ARN of the table stream (if enabled)"
  value       = aws_dynamodb_table.infraq_analytics.stream_arn
}

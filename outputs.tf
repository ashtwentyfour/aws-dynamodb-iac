output "dynamodb_table_names" {
  description = "Names of the DynamoDB tables created by this configuration."
  value       = [for table in aws_dynamodb_table.tables : table.name]
}

output "dynamodb_table_arns" {
  description = "ARNs of the DynamoDB tables created by this configuration."
  value       = [for table in aws_dynamodb_table.tables : table.arn]
}

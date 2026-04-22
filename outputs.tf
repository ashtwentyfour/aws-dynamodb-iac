output "dynamodb_table_names" {
  description = "Names of the DynamoDB tables created by this configuration."
  value       = [for table in aws_dynamodb_table.tables : table.name]
}

output "dynamodb_table_arns" {
  description = "ARNs of the DynamoDB tables created by this configuration."
  value       = [for table in aws_dynamodb_table.tables : table.arn]
}

output "sqs_queue_names" {
  description = "Names of the SQS queues created by this configuration."
  value       = [for queue in aws_sqs_queue.queues : queue.name]
}

output "sqs_queue_arns" {
  description = "ARNs of the SQS queues created by this configuration."
  value       = [for queue in aws_sqs_queue.queues : queue.arn]
}

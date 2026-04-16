variable "aws_region" {
  description = "AWS region where DynamoDB tables will be created."
  type        = string
  default     = "us-east-1"
}

variable "table_names" {
  description = "List of DynamoDB table names to create."
  type        = list(string)
  default     = ["demo"]
}

variable "hash_key_name" {
  description = "Partition key attribute name applied to every table."
  type        = string
  default     = "pk"
}

variable "tags" {
  description = "Tags applied to all DynamoDB tables."
  type        = map(string)
  default     = {}
}

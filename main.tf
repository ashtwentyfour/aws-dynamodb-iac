provider "aws" {
  region = var.aws_region
}

locals {
  unique_table_names = toset(var.table_names)
  unique_queue_names = toset(var.queue_names)
}

resource "aws_dynamodb_table" "tables" {
  for_each = local.unique_table_names

  name         = each.value
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash_key_name

  attribute {
    name = var.hash_key_name
    type = "S"
  }

  tags = merge(
    {
      ManagedBy = "Terraform"
    },
    var.tags
  )
}

resource "aws_sqs_queue" "queues" {
  for_each = local.unique_queue_names

  name = each.value

  tags = merge(
    {
      ManagedBy = "Terraform"
    },
    var.tags
  )
}

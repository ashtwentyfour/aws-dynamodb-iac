provider "aws" {
  region = var.aws_region
}

locals {
  unique_table_names = toset(var.table_names)
  unique_queue_names = toset(var.queue_names)
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
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

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-2a"
  size              = 40

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ecs_cluster" "foo" {
  name = "white-hart"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

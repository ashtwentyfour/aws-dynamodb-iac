terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tf-state-871834100302-us-east-1-an"
    key    = "aws-dynamodb-iac/terraform.tfstate"
    region = "us-east-1"
  }
}

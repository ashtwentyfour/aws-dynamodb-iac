aws_region  = "us-east-1"
table_names = ["demo", "customers"]
queue_names = ["demo-events"]

tags = {
  Environment = "development"
  Project     = "aws-dynamodb-iac"
}

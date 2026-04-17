# aws-dynamodb-iac

Terraform configuration for creating multiple DynamoDB tables from a list input

## What it does

- Stores Terraform state in the S3 bucket `tf-state-871834100302-us-east-1-an`
- Creates one DynamoDB table per entry in `table_names`
- Uses on-demand billing (`PAY_PER_REQUEST`)
- Applies the same string partition key to every table, defaulting to `pk`

## Files

- `versions.tf`: Terraform, provider, and remote backend configuration
- `variables.tf`: Input variables
- `main.tf`: AWS provider and DynamoDB table resources
- `outputs.tf`: Table name and ARN outputs
- `terraform.tfvars.example`: Example variable values
- `env/dev.tfvars`: Development environment values

## Usage

1. Create or select the `development` workspace
2. Run Terraform with the development vars file:

```bash
terraform init
terraform workspace select development || terraform workspace new development
terraform plan -var-file=env/dev.tfvars
terraform apply -var-file=env/dev.tfvars
```

If you prefer a local default var file instead:

```bash
terraform plan
terraform apply
```

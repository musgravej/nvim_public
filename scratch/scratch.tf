terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  alias   = "user"
  region  = var.region
  profile = var.profile
}
resource "aws_dynamodb_table" "my_first_table" {
  name         = var.table_name
  billing_mode = var.table_billing_mode
  hash_key     = "employee-id"
  attribute {
    name = "employee-id"
    type = "S"
  }
  tags = {
    environment = "${var.environment}"
  }
}


provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

data "aws_secretsmanager_secret" "example" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "example" {
  secret_id = data.aws_secretsmanager_secret.example.id
}

output "secret_value" {
  value = jsondecode(data.aws_secretsmanager_secret_version.example.secret_string)
  sensitive = true
}



locals {
  full_access_creds = jsondecode(data.aws_secretsmanager_secret_version.example.secret_string)
}

provider "aws" {
  alias   = "full_access"
  region  = "us-west-2"
  access_key = local.full_access_creds.access_key
  secret_key = local.full_access_creds.secret_key
}



resource "aws_s3_bucket" "example_bucket" {
  provider = aws.full_access

  bucket = "balu11221"
  acl    = "private"

  tags = {
    Name = "Example Bucket"
  }
}
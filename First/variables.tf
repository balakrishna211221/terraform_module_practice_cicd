variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "secret_name" {
  type        = string
  description = "The name of the secret to retrieve from AWS Secrets Manager"
}

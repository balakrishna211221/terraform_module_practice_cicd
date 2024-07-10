variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_count" {
  description = "The number of subnets to create"
  type        = number
  default     = 2
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}

variable "Name" {
  description = "Name tag for the VPC and subnets"
  type        = string
}

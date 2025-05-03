variable "vpc_id" {
  description = "ID của VPC"
  type        = string
}

variable "environment" {
  description = "Môi trường triển khai (dev, staging, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "internet_gateway_id" {
  description = "ID của Internet Gateway"
  type        = string
}

variable "nat_gateway_id" {
  description = "ID của NAT Gateway"
  type        = string
  default     = null
}

variable "public_subnet_id" {
  description = "ID của Public Subnet"
  type        = string
  default     = ""
}

variable "private_subnet_id" {
  description = "ID của Private Subnet"
  type        = string
  default     = ""
}
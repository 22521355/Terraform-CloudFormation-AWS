variable "public_subnet_id" {
  description = "ID của Public Subnet để tạo NAT Gateway"
  type        = string
}

variable "environment" {
  description = "Môi trường triển khai (dev, staging, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "create_nat_gateway" {
  description = "Có tạo NAT Gateway hay không"
  type        = bool
  default     = true
}

variable "internet_gateway_id" {
  description = "ID của Internet Gateway (để tạo dependency)"
  type        = string
}
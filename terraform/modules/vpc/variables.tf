variable "vpc_cidr" {
  description = "CIDR block cho VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Môi trường triển khai (dev, staging, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "public_subnet_cidr" {
  description = "Danh sách các CIDR block cho Public Subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Danh sách các CIDR block cho Private Subnet"
  default = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Danh sách các AZ muốn sử dụng"
  type    = string
  default = "ap-southeast-1a"
}
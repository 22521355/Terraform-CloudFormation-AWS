variable "vpc_id" {
  description = "ID của VPC"
  type        = string
}

variable "environment" {
  description = "Môi trường triển khai (dev, staging, prod, etc.)"
  type        = string
  default     = "dev"
}
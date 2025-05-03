variable "key_name" {
  description = "Tên của SSH key pair"
  type        = string
}

variable "public_key" {
  description = "Public key SSH để tạo key pair"
  type        = string
}

variable "environment" {
  description = "Môi trường triển khai (dev, staging, prod, etc.)"
  type        = string
  default     = "dev"
}
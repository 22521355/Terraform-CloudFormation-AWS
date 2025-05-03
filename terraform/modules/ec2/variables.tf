variable "ami_id" {
  description = "AMI ID để sử dụng cho EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Loại EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Tên của SSH key pair để sử dụng"
  type        = string
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

variable "public_security_group_id" {
  description = "ID của Public Security Group"
  type        = string
  default     = ""
}

variable "private_security_group_id" {
  description = "ID của Private Security Group"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Môi trường triển khai (dev, staging, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "user_data" {
  description = "User data script cho EC2 instance"
  type        = string
  default     = ""
}

variable "create_public_instance" {
  description = "Có tạo EC2 instance trong Public Subnet hay không"
  type        = bool
  default     = true
}

variable "create_private_instance" {
  description = "Có tạo EC2 instance trong Private Subnet hay không"
  type        = bool
  default     = true
}
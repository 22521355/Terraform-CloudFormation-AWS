variable "aws_region" {
  description = "AWS Region muốn triển khai VPC"
  type        = string
  default     = "ap-southeast-1"
}

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
  default = "ap-southeast-1a"
}

variable "create_nat_gateway" {
  description = "Có tạo NAT Gateway hay không"
  type        = bool
  default     = true
}

variable "ami_id" {
  description = "AMI ID để sử dụng cho EC2 instances"
  type        = string
  default     = "ami-0df7a207adb9748c7" 
}

variable "instance_type" {
  description = "Loại EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ssh_public_key" {
  description = "Public key SSH để tạo key pair"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDeuO4AUO8mQKQ27GyrQjsNLoqs9+YPKL8a0IyOYDveUYenEavmrO5dOMd9mqr1RQZIco8XzsISUjCa+G5b5BXSwex+oe/LGyM/WiDwzEkBKjiqEPCklyaFMcxwi8V8x6GYEkhGLTNvOcC1aukas2wZRUyGzC92N4zCPgzMK7Baitj/+5DYlQN0RVye2MdDVJ2PhoFfJ4pSHTf9EDEaXMo/tN9AIT3AADVlY02M4kixogLtBOnQ1ajJqy6b96o7FjOFbnaJhFd5tb6GymMhkWTveW9XflD4myGKQG4sciIIyzBsoYKghbHALeFXcXszhsXlJOc2rF899bYW4NiGQjCuTodbcn3jReDtw4J3KTYTGizH84LRlJ+/2WFZB9xEjQp/rfocLKm1z1oAYzODmh371kl/XeYEI1PkTx345fkjpiG7FGTj957vIUNniCXkbU82c7l41+rx3ZO224pqjmWLlxz2msEY/UlmX5/5RHdHUlSrNOHdgteeBlXE/8eSO3933BudpeOjAK6ZQLiJkUKYLKWEr6Gchcryvrxxy6upGnqRZxobHLPI3ZuWvFzeIbrfrwm7nK/TEp0+BESXVwhdbfN4z4tCjI1cd13RztujeF97qrX44Sf+j0ZwmRMUyGnTy5j8wwbZUq8wZKIuMjKYEmvbVNaJ4/0KB0urHGGBoQ== pc@bacann"
}

variable "allowed_ssh_cidr" {
  description = "IP hoặc CIDR range được phép kết nối SSH đến Public EC2"
  type        = string
  default     = "192.168.1.5/32" # 
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
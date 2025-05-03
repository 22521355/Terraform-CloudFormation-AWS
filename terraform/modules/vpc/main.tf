  /*
    VPC Module - Chỉ tạo VPC và Subnets
  */

  # Tạo VPC
  resource "aws_vpc" "main" {
    cidr_block           = var.vpc_cidr
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
      Name = "${var.environment}-vpc"
    }
  }

  # Tạo Public Subnets
  resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.public_subnet_cidr
    availability_zone       = var.availability_zone
    map_public_ip_on_launch = true

    tags = {
      Name = "${var.environment}-public-subnet"
    }
  }

  # Tạo Private Subnets
  resource "aws_subnet" "private" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.private_subnet_cidr
    availability_zone = var.availability_zone

    tags = {
      Name = "${var.environment}-private-subnet"
    }
  }
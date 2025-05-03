/*
  EC2 Module - Tạo EC2 instances trong Public và Private Subnet
*/

# Tạo EC2 instance trong Public Subnet
resource "aws_instance" "public" {
  count                       = var.create_public_instance ? 1 : 0
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_security_group_id]
  associate_public_ip_address = true

  user_data = var.user_data != "" ? var.user_data : null

  tags = {
    Name = "${var.environment}-public-instance"
  }
}

# Tạo EC2 instance trong Private Subnet
resource "aws_instance" "private" {
  count                  = var.create_private_instance ? 1 : 0
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_security_group_id]

  user_data = var.user_data != "" ? var.user_data : null

  tags = {
    Name = "${var.environment}-private-instance"
  }
}
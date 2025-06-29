/*
  Route Tables Module - Tạo và quản lý Route Tables
*/

# Tạo Route Table cho Public Subnet
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "${var.environment}-public-route-table"
  }
}
# Liên kết Public Subnet với Public Route Table
resource "aws_route_table_association" "public" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
}

# Tạo Route Table cho Private Subnet
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.nat_gateway_id != null ? [1] : []
    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = var.nat_gateway_id
    }
  }

  tags = {
    Name = "${var.environment}-private-route-table"
  }
}
# Liên kết Private Subnet với Private Route Table
resource "aws_route_table_association" "private" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private.id
}
/*
  NAT Gateway Module - Tạo NAT Gateway và Elastic IP
*/

# Tạo Elastic IP cho NAT Gateway
resource "aws_eip" "nat" {
  count  = var.create_nat_gateway ? 1 : 0
  domain = "vpc"

  tags = {
    Name = "${var.environment}-eip-nat"
  }
}

# Tạo NAT Gateway
resource "aws_nat_gateway" "main" {
  count         = var.create_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat[0].id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "${var.environment}-nat-gateway"
  }

  depends_on = [var.internet_gateway_id]
}
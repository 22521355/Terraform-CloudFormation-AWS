/*
  Internet Gateway Module - Tạo Internet Gateway
*/

# Tạo Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.environment}-igw"
  }
}
/*
  Key Pair Module - Tạo SSH Key Pair để kết nối đến EC2 instances
*/

# Tạo Key Pair từ public key được cung cấp
resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = var.public_key

  tags = {
    Name = "${var.environment}-${var.key_name}"
  }
}
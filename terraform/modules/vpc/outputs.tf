output "vpc_id" {
  description = "ID của VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "CIDR block của VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_id" {
  description = "Danh sách ID của các Public Subnet"
value = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "Danh sách ID của các Private Subnet"
value = aws_subnet.private.id
}
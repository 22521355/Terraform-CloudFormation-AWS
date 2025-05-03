output "vpc_id" {
  description = "ID của VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block của VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_id" {
  description = "ID của các Public Subnet"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_ids" {
  description = "ID của các Private Subnet"
  value       = module.vpc.private_subnet_id
}

output "internet_gateway_id" {
  description = "ID của Internet Gateway"
  value       = module.internet_gateway.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID của NAT Gateway"
  value       = module.nat_gateway.nat_gateway_id
}

output "nat_gateway_eip" {
  description = "Elastic IP của NAT Gateway"
  value       = module.nat_gateway.nat_gateway_eip
}

output "public_route_table_id" {
  description = "ID của Public Route Table"
  value       = module.route_tables.public_route_table_id
}

output "private_route_table_id" {
  description = "ID của Private Route Table"
  value       = module.route_tables.private_route_table_id
}

output "default_security_group_id" {
  description = "ID của Security Group mặc định"
  value       = module.default_security_group.security_group_id
}

output "public_ec2_security_group_id" {
  description = "ID của Security Group cho Public EC2"
  value       = module.public_ec2_security_group.security_group_id
}

output "private_ec2_security_group_id" {
  description = "ID của Security Group cho Private EC2"
  value       = module.private_ec2_security_group.security_group_id
}

output "ec2_key_name" {
  description = "Tên của SSH key pair đã tạo"
  value       = module.key_pair.key_name
}

output "public_instance_id" {
  description = "ID của EC2 instance trong Public Subnet"
  value       = module.ec2_instances.public_instance_id
}

output "private_instance_id" {
  description = "ID của EC2 instance trong Private Subnet"
  value       = module.ec2_instances.private_instance_id
}

output "public_instance_public_ip" {
  description = "Public IP của EC2 instance trong Public Subnet"
  value       = module.ec2_instances.public_instance_public_ip
}

output "ssh_to_public_instance" {
  description = "Lệnh SSH để kết nối đến Public Instance"
  value       = "ssh -i ec2-key-lab1.pem ec2-user@${module.ec2_instances.public_instance_public_ip}"
}

output "ssh_to_private_instance" {
  description = "Hướng dẫn SSH đến Private Instance"
  value       = "1. Đăng nhập vào Public Instance trước: ssh -i ec2-key-lab1.pem ec2-user@${module.ec2_instances.public_instance_public_ip}\n2. Sau đó, từ Public Instance, chạy: ssh -i ec2-key-lab1.pem ec2-user@${module.ec2_instances.private_instance_private_ip}"
}
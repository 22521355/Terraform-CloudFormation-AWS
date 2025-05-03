output "public_instance_id" {
  description = "ID của EC2 instance trong Public Subnet"
  value       = var.create_public_instance ? aws_instance.public[0].id : null
}

output "private_instance_id" {
  description = "ID của EC2 instance trong Private Subnet"
  value       = var.create_private_instance ? aws_instance.private[0].id : null
}

output "public_instance_public_ip" {
  description = "Public IP của EC2 instance trong Public Subnet"
  value       = var.create_public_instance ? aws_instance.public[0].public_ip : null
}

output "public_instance_private_ip" {
  description = "Private IP của EC2 instance trong Public Subnet"
  value       = var.create_public_instance ? aws_instance.public[0].private_ip : null
}

output "private_instance_private_ip" {
  description = "Private IP của EC2 instance trong Private Subnet"
  value       = var.create_private_instance ? aws_instance.private[0].private_ip : null
}
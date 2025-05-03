output "nat_gateway_id" {
  description = "ID của NAT Gateway"
  value       = var.create_nat_gateway ? aws_nat_gateway.main[0].id : null
}

output "nat_gateway_eip" {
  description = "Elastic IP của NAT Gateway"
  value       = var.create_nat_gateway ? aws_eip.nat[0].public_ip : null
}
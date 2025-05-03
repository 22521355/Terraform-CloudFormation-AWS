output "security_group_id" {
  description = "ID của Security Group"
  value       = aws_security_group.this.id
}

output "security_group_name" {
  description = "Tên của Security Group"
  value       = aws_security_group.this.name
}
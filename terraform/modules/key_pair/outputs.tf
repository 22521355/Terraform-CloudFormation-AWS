output "key_name" {
  description = "Tên của key pair được tạo"
  value       = aws_key_pair.this.key_name
}

output "key_pair_id" {
  description = "ID của key pair"
  value       = aws_key_pair.this.id
}
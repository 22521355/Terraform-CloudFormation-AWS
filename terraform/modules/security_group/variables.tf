variable "vpc_id" {
  description = "ID của VPC"
  type        = string
}

variable "environment" {
  description = "Môi trường triển khai (dev, staging, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "name" {
  description = "Tên của Security Group"
  type        = string
}

variable "description" {
  description = "Mô tả của Security Group"
  type        = string
  default     = "Security Group"
}

variable "ingress_rules" {
  description = "Danh sách các quy tắc ingress"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    description     = string
    cidr_blocks     = optional(list(string), null)
    self            = optional(bool, null)
    prefix_list_ids = optional(list(string), null)
    security_groups = optional(list(string), null)
  }))
  default = []
}

variable "egress_rules" {
  description = "Danh sách các quy tắc egress"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    description     = string
    cidr_blocks     = optional(list(string), null)
    self            = optional(bool, null)
    prefix_list_ids = optional(list(string), null)
  }))
  default = []
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs."
  type        = list(string)
}

variable "frontend_instance_ids" {
  description = "List of frontend instance IDs."
  type        = list(string)
}

variable "alb_sg_id" {
  description = "The security group ID for the ALB."
  type        = string
}

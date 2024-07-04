variable "application_name" {
  description = "The name of the CodeDeploy application."
  type        = string
}

variable "deployment_group_name" {
  description = "The name of the CodeDeploy deployment group."
  type        = string
}

variable "service_role_arn" {
  description = "The ARN of the service role for CodeDeploy."
  type        = string
}

variable "ec2_tag_key" {
  description = "The tag key to identify EC2 instances for deployment."
  type        = string
}

variable "ec2_tag_value" {
  description = "The tag value to identify EC2 instances for deployment."
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the ALB target group."
  type        = string
}

variable "alb_name" {
  description = "The name of the ALB."
  type        = string
  default     = "motoshop"
}

variable "project_name" {
  description = "The name of the CodeBuild project."
  type        = string
}

variable "database_password" {
  description = "Database password stored in AWS Secrets Manager."
  type        = string
}

variable "source_repo" {
  description = "The source repository for the build."
  type        = string
}

variable "service_role_arn" {
  description = "The ARN of the service role for CodeBuild."
  type        = string
}

variable "pipeline_name" {
  description = "The name of the CodePipeline."
  type        = string
}

variable "service_role_arn" {
  description = "The ARN of the service role for CodePipeline."
  type        = string
}

variable "artifact_store_location" {
  description = "The S3 bucket for storing artifacts."
  type        = string
}

variable "github_owner" {
  description = "The GitHub owner."
  type        = string
}

variable "github_repo" {
  description = "The GitHub repository."
  type        = string
}

variable "github_branch" {
  description = "The branch of the GitHub repository."
  type        = string
}

variable "github_token" {
  description = "The GitHub OAuth token."
  type        = string
}

variable "build_project_name" {
  description = "The name of the CodeBuild project."
  type        = string
}

variable "application_name" {
  description = "The name of the CodeDeploy application."
  type        = string
}

variable "deployment_group_name" {
  description = "The name of the CodeDeploy deployment group."
  type        = string
}

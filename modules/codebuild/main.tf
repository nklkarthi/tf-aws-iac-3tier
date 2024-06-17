resource "aws_codebuild_project" "project" {
  name           = var.project_name
  description    = "CodeBuild project for ${var.project_name}"
  build_timeout  = "5"

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    environment_variable {
      name  = "DATABASE_PASSWORD"
      value = var.database_password
      type  = "SECRETS_MANAGER"
    }
  }

  service_role = var.service_role_arn

  source {
    type            = "GITHUB"
    location        = var.source_repo
    buildspec       = "buildspec.yml"
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  cache {
    type = "LOCAL"
  }
}

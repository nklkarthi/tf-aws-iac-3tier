resource "aws_codedeploy_app" "app" {
  name = var.application_name
}

resource "aws_codedeploy_deployment_group" "deployment_group" {
  app_name              = aws_codedeploy_app.app.name
  deployment_group_name = var.deployment_group_name
  service_role_arn      = var.service_role_arn

  deployment_style {
    deployment_type = "IN_PLACE"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

  ec2_tag_filter {
    key = var.ec2_tag_key
    value = var.ec2_tag_value
    type = "KEY_AND_VALUE"
  }

  load_balancer_info {
    target_group_info {
      name = var.target_group_name
    }
  }
}

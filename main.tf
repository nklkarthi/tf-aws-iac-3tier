module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

module "ec2" {
  source                  = "./modules/ec2"
  vpc_id                  = module.vpc.vpc_id
  public_subnet_ids       = module.vpc.public_subnet_ids
  private_subnet_ids      = module.vpc.private_subnet_ids
  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  frontend_instance_count = var.frontend_instance_count
  backend_instance_count  = var.backend_instance_count
  private_subnets         = var.private_subnets
}

module "alb" {
  source                = "./modules/alb"
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  frontend_instance_ids = module.ec2.frontend_instance_ids
  alb_sg_id             = module.ec2.frontend_sg_id
}

module "rds" {
  source               = "./modules/rds"
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  private_subnet_ids   = module.vpc.private_subnet_ids
  rds_sg_id            = module.ec2.backend_sg_id
}

module "kms" {
  source = "./modules/kms"
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "ecr" {
  source = "./modules/ecr"
}

module "codebuild" {
  source            = "./modules/codebuild"
  project_name      = var.project_name
  database_password = var.database_password
  source_repo       = var.source_repo
  service_role_arn  = module.iam.codebuild_role_arn
}

module "codepipeline" {
  source                  = "./modules/codepipeline"
  pipeline_name           = var.pipeline_name
  service_role_arn        = module.iam.codepipeline_role_arn
  artifact_store_location = module.s3.bucket_name
  github_owner            = var.github_owner
  github_repo             = var.github_repo
  github_branch           = var.github_branch
  github_token            = var.github_token
  build_project_name      = module.codebuild.project_name
  application_name        = var.application_name
  deployment_group_name   = var.deployment_group_name
}

# module "codedeploy" {
#   source                = "./modules/codedeploy"
#   application_name      = var.application_name
#   deployment_group_name = var.deployment_group_name
#   service_role_arn      = module.iam.codedeploy_role_arn
#   ec2_tag_key           = var.ec2_tag_key
#   ec2_tag_value         = var.ec2_tag_value
#   target_group_arn      = module.alb.target_group_arn
#   alb_name              = module.alb.alb_dns_name
# }

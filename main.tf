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
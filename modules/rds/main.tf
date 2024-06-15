resource "aws_db_instance" "main" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.rds_sg_id]

  multi_az             = true
  storage_type         = "gp2"
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "main-subnet-group"
  }
}

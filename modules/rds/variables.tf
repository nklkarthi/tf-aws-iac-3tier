variable "allocated_storage" {
  description = "The allocated storage size."
  type        = number
}

variable "engine" {
  description = "The database engine."
  type        = string
}

variable "engine_version" {
  description = "The engine version."
  type        = string
}

variable "instance_class" {
  description = "The instance class."
  type        = string
}

variable "db_name" {
  description = "The name of the database."
  type        = string
}

variable "username" {
  description = "The username for the database."
  type        = string
}

variable "password" {
  description = "The password for the database."
  type        = string
}

variable "parameter_group_name" {
  description = "The DB parameter group name."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs."
  type        = list(string)
}

variable "rds_sg_id" {
  description = "The security group ID for RDS."
  type        = string
}

variable "region" {
  description = "The AWS region."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks."
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks."
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones."
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID to use for the instances."
  type        = string
}

variable "instance_type" {
  description = "The instance type."
  type        = string
}

variable "frontend_instance_count" {
  description = "Number of frontend instances."
  type        = number
}

variable "backend_instance_count" {
  description = "Number of backend instances."
  type        = number
}

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
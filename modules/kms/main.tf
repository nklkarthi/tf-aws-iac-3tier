resource "aws_kms_key" "main" {
  description             = "KMS key for RDS"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

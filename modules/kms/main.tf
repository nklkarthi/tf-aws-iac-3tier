resource "aws_kms_key" "main" {
  description             = "KMS key for RDS"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "main" {
  name          = "alias/rds-key"
  target_key_id = aws_kms_key.main.id
}

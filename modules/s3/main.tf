resource "aws_s3_bucket" "artifacts" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}


resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.acl

  versioning {
    enabled = true
  }

  tags = {
    Name = var.bucket_name
  }
}


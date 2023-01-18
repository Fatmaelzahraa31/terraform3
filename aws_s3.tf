resource "aws_s3_bucket" "s3-bucket" {
  bucket = "s3-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}
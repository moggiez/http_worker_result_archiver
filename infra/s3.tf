resource "aws_s3_bucket" "_" {
  bucket = "${var.domain_name}-${replace(var.project_name, "_", "-")}"
  acl    = "private"

  tags = {
    Project = var.domain_name
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_block_public_access" {
  bucket = aws_s3_bucket._.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

## Success results bucket
resource "aws_s3_bucket" "moggiez_call_responses_success" {
  bucket = "moggiez-call-responses-success"
  acl    = "private"

  tags = {
    Project = var.domain_name
  }
}

## Failure results bucket
resource "aws_s3_bucket" "moggiez_call_responses_failure" {
  bucket = "moggiez-call-responses-failure"
  acl    = "private"

  tags = {
    Project = var.domain_name
  }
}
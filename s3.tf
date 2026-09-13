# S3 bucket for testing with versioning and encryption enabled

resource "aws_s3_bucket" "infraq_test" {
  bucket = "infraq-test-bucket-2026"

  tags = {
    Name        = "infraq-test-bucket-2026"
    Environment = "test"
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "infraq_test" {
  bucket = aws_s3_bucket.infraq_test.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "infraq_test" {
  bucket = aws_s3_bucket.infraq_test.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

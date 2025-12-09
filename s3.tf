resource "aws_s3_bucket" "s3" {
  bucket = "week7utcmybucketJulius"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
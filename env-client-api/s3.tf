resource "aws_s3_bucket" "document-client" {
  bucket = "document-${var.name}"
}
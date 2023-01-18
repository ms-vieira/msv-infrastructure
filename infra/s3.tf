resource "aws_s3_bucket" "beanstalk_deploys" {
  bucket = "${var.name}-deploy-prod"
}

resource "aws_s3_bucket_object" "docker" {
    depends_on = [
      aws_s3_bucket.beanstalk_deploys
    ]
  bucket = "${var.name}-deploy-prod"
  key    = "${var.name}.zip"
  source = "${var.name}.zip"
  etag = filemd5("${var.name}.zip")
}

resource "aws_s3_bucket" "document-client" {
  bucket = "document-${var.name}"
}
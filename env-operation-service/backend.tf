terraform {
  backend "s3" {
    bucket = "terraform-state-msv-operation-service"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
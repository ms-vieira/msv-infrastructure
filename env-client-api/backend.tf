terraform {
  backend "s3" {
    bucket = "terraform-state-msv-client-api"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
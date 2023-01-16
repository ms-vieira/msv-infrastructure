terraform {
  backend "s3" {
    bucket = "terraform-state-msv"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
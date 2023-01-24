terraform {
  backend "s3" {
    bucket = "terraform-state-msv-interface-app"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
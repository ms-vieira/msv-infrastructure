module "prod" {
  source = "../infra"

  name = "prod"
  description = "prod-application"
  max = 1
  machine = "t2.micro"
  environment = "prod-environment"
}
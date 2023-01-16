module "prod" {
  source = "../infra"

  name = "prod-client-api"
  description = "prod-application"
  max = 1
  machine = "t2.micro"
  environment = "prod-environment"
}
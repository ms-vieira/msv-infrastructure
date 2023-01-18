module "prod" {
  source = "../infra"

  name = "prod-client-api"
  description = "prod-application-client-api"
  max = 1
  machine = "t2.micro"
  environment = "prod-environment-client-api"
}
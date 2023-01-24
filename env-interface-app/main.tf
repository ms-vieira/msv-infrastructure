module "prod" {
  source = "../infra"

  name = "prod-interface-app"
  description = "prod-application-interface-app"
  max = 1
  machine = "t2.micro"
  environment = "prod-environment-interface-app"
}
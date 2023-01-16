module "prod" {
  source = "../infra"

  name = "prod-operation-service"
  description = "prod-application-operation-service"
  max = 1
  machine = "t2.micro"
  environment = "prod-environment-operation-service"
}
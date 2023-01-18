resource "aws_dynamodb_table" "client-table" {
  name           = "Client"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "ClientId"
  range_key      = "CreatedAt"

  attribute {
    name = "ClientId"
    type = "S"
  }

  attribute {
    name = "CreatedAt"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }
  
  tags = {
    Name        = "client-table"
    Environment = "prod-environment"
  }
}
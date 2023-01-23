data "aws_vpc" "default" {
  default = true
}
resource "random_string" "operation-db-password" {
  length  = 32
  upper   = true
  number  = true
  special = false
}
resource "aws_security_group" "operation-sg" {
  vpc_id      = "${data.aws_vpc.default.id}"
  name        = "operation-sg"
  description = "Allow all inbound for Postgres"
ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_db_instance" "operation-db" {
  identifier             = "operation-db"
  name                   = "operationdb"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "14.5"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.operation-sg.id]
  username               = "msvuser"
  password               = "random_string.operation-db-password.result}"
}
resource "aws_db_instance" "default" {
  allocated_storage    = var.storage
  db_name              = var.db_name
  identifier =           var.identifier
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  storage_type =           var.storage_type
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name  = aws_db_subnet_group.private_subnet_group.id
  vpc_security_group_ids = var.rds_security_group
}

resource "aws_db_subnet_group" "private_subnet_group" {
  name       = "main"
  subnet_ids = toset(var.private_subnet_ids) 
}
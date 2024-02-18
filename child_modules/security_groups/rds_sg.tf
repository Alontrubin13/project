resource "aws_security_group" "rds_sg" {
  name        = var.rds_sg_name
  description = "PORT 3306"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.rds_sg_name
  }

  ingress {
    from_port        = var.rds_port
    to_port          = var.rds_port
    protocol         = "tcp"
    security_groups = [aws_security_group.sg_main.id]
  }

      egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "sg_main" {
  name        = var.sg_name
  description = "HTTP, HTTPS, SSH"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_name
  }

  ingress {
    from_port        = var.HTTP
    to_port          = var.HTTP
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = var.HTTPS
    to_port          = var.HTTPS
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = var.SSH
    to_port          = var.SSH
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}


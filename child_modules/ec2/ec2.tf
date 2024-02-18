resource "aws_instance" "default" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids = var.security_group
  subnet_id = var.public_subnet_id
  key_name = var.key_name

  tags = {
    Name = var.ec2_tag
  }
}
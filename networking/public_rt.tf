resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.rt_tag
  }
}


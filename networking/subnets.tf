resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets_cidr_blocks)

  vpc_id            = aws_vpc.example.id
  cidr_block        = var.public_subnets_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "Public-Subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets_cidr_blocks)

  vpc_id            = aws_vpc.example.id
  cidr_block        = var.private_subnets_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "Private-Subnet-${count.index + 1}"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count = length(aws_subnet.public_subnet)

  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}
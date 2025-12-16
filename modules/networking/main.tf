resource "aws_vpc" "custom_vpc" {
  cidr_block       = var.cidr_block

  tags = merge(var.custom_tags,
  {
    Name = var.vpc_name
  })
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidr)
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = element(var.public_subnet_cidr, count.index)

  tags = merge( var.custom_tags, 
  {
     Name = "${var.public_subnet_name}-${count.index}"
  })
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidr)
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = element(var.var.private_subnet_cidr, count.index)

  tags = merge( var.custom_tags, 
  {
     Name = "${var.public_subnet_name}-${count.index}"
  })
}

resource "aws_internet_gateway" "public_gateway" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = merge(var.custom_tags,
  {
    Name = var.internet_gateway
  })
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }
  tags = merge(var.custom_tags, {
    Name = "Public-route-table"
  })
}

resource "aws_route_table_association" "public_subnet_route_association" {
  subnet_id      = aws_subnet.public_subnets.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = merge(var.custom_tags, {
    Name = "Private-route-table"
  })
}


resource "aws_route_table_association" "public_subnet_route_association" {
  subnet_id      = aws_subnet.public_subnets.id
  route_table_id = aws_route_table.public_route.id
}

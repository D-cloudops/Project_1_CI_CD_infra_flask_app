output "vpc_id" {
    value = aws_vpc.custom_vpc.id
}

output "public_subnet_id" {
   value = aws_vpc.public_subnets[*].id
}

output "private_subnet_cidr" {
  value = aws_vpc.private_subnets[*].id
}


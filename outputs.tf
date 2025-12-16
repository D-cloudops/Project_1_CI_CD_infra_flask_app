output "vpc_id" {
  value = module.vpc_network.vpc_id
}

output "public_subnet_id" {
 value = module.vpc_network.public_subnet_id 
}

output "private_subnet_id" {
  value = module.vpc_network.private_subnet_cidr
}
module "vpc_network" {
    source = "./modules/networking"
    vpc_name = var.vpc_name
    custom_tags = var.custom_tags
    cidr_block = var.vpc_cidr_block
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    internet_gateway = var.internet_gateway_name
} 

module "compute" {
  source = "./modules/compute"
  vpc_id = module.vpc_network.vpc_id
  security_group_name = var.security_group_name
  ingress_ports = var.ingress_ports
  public_key = file(var.public_key_path)
  assign_public_ip = true
  subnet_id = var.subnet_id
  user_data = file(var.user_data_path)
  instance_name = var.instance_name
}
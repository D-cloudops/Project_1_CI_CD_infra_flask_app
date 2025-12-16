module "vpc_network" {
    source = "./modules/networking"
    vpc_name = var.vpc_name
    custom_tags = var.custom_tags
    cidr_block = var.vpc_cidr_block
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    internet_gateway = var.internet_gateway_name
} 

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"] # The owner alias for official Amazon AMIs

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"] # Wildcard filter for the standard AL2 AMI name pattern
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "compute" {
  source = "./modules/compute"
  ami_id = data.aws_ami.amazon_linux_2.id
  vpc_id = module.vpc_network.vpc_id
  security_group_name = var.security_group_name
  ingress_ports = var.ingress_ports
  public_key = file(var.public_key_path)
  assign_public_ip = true
  subnet_id = module.vpc_network.public_subnet_id[0]
  user_data = file(var.user_data_path)
  instance_name = var.instance_name
}
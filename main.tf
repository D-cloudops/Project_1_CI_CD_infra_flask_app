module "vpc_network" {
    source = "./modules/networking"
    vpc_name = var.vpc_name
    custom_tags = var.custom_tags
    cidr_block = var.vpc_cidr_block
    list_az = var.az
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

module "jenkins_sg_id" {
  source = "./modules/security_group"
  security_group_name = var.jenkins_sg_name
  vpc_id = module.vpc_network.vpc_id
  ingress_ports = var.ingress_ports
}

module "compute" {
  source = "./modules/ec2_instance"
  ami_id = data.aws_ami.amazon_linux_2.id
  ec2_sg_id = [module.jenkins_sg_id.security_group_id]
  public_key = file(var.public_key_path)
  assign_public_ip = true
  subnet_id = module.vpc_network.public_subnet_id[0]
  user_data = file(var.user_data_path)
  instance_name = var.instance_name
}

module "lb_security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc_network.vpc_id
  security_group_name = var.lb_sg_name
  ingress_ports = var.lb_ingress_ports
  egress_ports = var.lb_egress_ports
}

module "jenkins_lb" {
  depends_on = [module.lb_security_group]
  source = "./modules/loadbalancer"
  target_group_name = var.target_group_name
  target_group_port = var.target_group_port
  vpc_id = module.vpc_network.vpc_id
  instance_id = module.compute.instance_id
  lb_name = var.lb_name
  lb_sg_id = [module.lb_security_group.security_group_id]
  lb_subnet_id = [module.vpc_network.public_subnet_id[0],module.vpc_network.public_subnet_id[1] ]
  lb_listener_port = var.lb_listener_port
  lb_listener_protocol = var.lb_listener_protocol
}
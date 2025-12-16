module "vpc_network" {
    source = "./modules/networking"
    vpc_name = "custom_vpc"
    custom_tags = {
       ManagedBy = "Terraform"
    }
    cidr_block = "132.14.0.0/26"
    public_subnet_cidr = ["132.14.0.0/28", "132.14.0.16/28"]
    private_subnet_cidr = ["132.14.0.32/28"]
    internet_gateway = "custom-vpc-gateway"
} 
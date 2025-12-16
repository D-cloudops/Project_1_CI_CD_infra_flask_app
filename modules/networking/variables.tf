variable "vpc_name" {
  type = string
  description = "Enter the name of custome vpc"
}

variable "custom_tags" {
  type = map(string)
  description = "Define the common tags for network resource"
  default = {
    "ManagedBy" = "Terraform"
  }
}

variable "cidr_block" {
  type = string
}

variable "public_subnet_cidr" {
  type = list(string)
  description = "Enter the cidr of public subnets to be created"
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "Enter the cidr of private subnets to be created"
}

variable "public_subnet_name" {
    type = string
    description = "Enter the name of public subnet"
    default = "public-subnet"
}

variable "private_subnet_name" {
    type = string
    description = "Enter the name of public subnet"
    default = "private-subnet"
}

variable "internet_gateway" {
   type = string
   description = "Enter the name of internet gateway"
}
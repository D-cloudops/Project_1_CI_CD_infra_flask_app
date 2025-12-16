variable "region" {
  type = string 
  default = "us-east-1"
  description = "Region to deploy resources"
}

#######variables for vpc

variable "vpc_name" {
  type = string
  default = "custom_vpc"
  description = "Name of VPC"
}

variable "custom_tags" {
  type = map(string)
  default = {
       ManagedBy = "Terraform"
    }
  description = "Common tags to resources"
}


variable "vpc_cidr_block" {
  type = string
  description = "VPC CIDR block"

}

variable "public_subnet_cidr" {
  type = list(string)
  description = "public subnet cidr block"
}

variable "private_subnet_cidr" {
  type = list(string)
  description = "private subnet cidr block"
}

variable "internet_gateway_name" {
  type = string
  description = "Name of internet gateway"
  default = "Custom_vpc_public_gateway"
}

#####security group variables

variable "security_group_name" {
  type = string
  description = "Security group name"
}

variable "ingress_ports" {
  type = map(object({ 
        port = string
        protocol = string
        cidr_ipv4 = string
        }))
  description = "Set of rules to allow Ingress traffic"
  default = {
     Jenkins = {
       port = "8080"
       protocol = "tcp"
       cidr_ipv4 = "0.0.0.0/0"
    }
  }
}

variable "public_key_path" {
  type = string
  description = "Path of public Key"
}

########varible of ec2 instance

variable "user_data_path" {
  type = string
  description = "Path of the user data script"
}

variable "instance_name" {
  type = string
  description = "Name of ec2 instance"
}

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

variable "jenkins_sg_name" {
  type = string
  description = "Security group name"
}

variable "ingress_ports" {
  type = list(object({ 
        port = string
        protocol = string
        cidr_ipv4 = string
        }))
  description = "Set of rules to allow Ingress traffic"
  default =  [{
       port = "8080"
       protocol = "tcp"
       cidr_ipv4 = "0.0.0.0/0"
    }]
  }


variable "egress_ports" {
  type = list(object({ 
        port = string
        protocol = string
        cidr_ipv4 = string
        }))
  description = "Set of rules to allow Ingress traffic"
  default = [{
    port = "-1"
    protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  }]
}

variable "az" {
  type = list(string)
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

## security group varibles for LB

variable "lb_ingress_ports" {
  type = list(object({
    port = string
    protocol = string
    cidr_ipv4 = string 
  }))
  description = "Ingress ports for alb"
}

variable "lb_egress_ports" {
  type = list(object({ 
        port = string
        protocol = string
        cidr_ipv4 = string
        }))
  description = "Set of rules to allow Ingress traffic"
  default = [{
    port = "-1"
    protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
  }]
}

## Varibled declaration for load balancer

variable "lb_sg_name" {
  type = string
  description = "LB Security group name"
}

variable "target_group_name" {
  type = string
  description = "Target Group Name"
}

variable "target_group_port" {
  type = string
}

variable "target_group_portocol" {
  type = string
}


variable "health_check_port" {
  type = string
  description = "Port for target group health check"
  default = "80"
}

variable "health_check_protocol" {
  type = string
  description = "portocol for target group health check"
  default = "HTTP"
}

variable "lb_name" {
  type = string
  description = "Name of load balancer" 
}



variable "lb_listener_port" {
  type = string
  description = "LB Listener Port"
}


variable "lb_listener_protocol" {
  type = string
}


### variable declaration of hosted zone 

variable "domain_name" {
  type = string
  description = "Domain Name"  
}

variable "sub_domain" {
  type = string
  description = "Sub Domain to add a record in hosted zone"
}


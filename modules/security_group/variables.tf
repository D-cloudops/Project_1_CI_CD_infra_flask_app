variable "security_group_name" {
  type = string
  description = "Enter the name for security group"
  default = "Jenkins-SG"
}

variable "vpc_id" {
  type = string
}

variable "custom_tags" {
  type = map(string)
  description = "Define the common tags for network resource"
  default = {
    "ManagedBy" = "Terraform"
  }
}


variable "ingress_ports" {
   type = map(object({ 
        port = string
        protocol = string
        cidr_ipv4 = string
        }))
   description = "Enter the ports to be allowed in Security group ingress rule"
   default = {
     Jenkins = {
        port = "8080"
        protocol = "tcp"
        cidr_ipv4 = "0.0.0.0/0"
   }
   }
}

variable "egress_ports" {
   type = map(object({
        port = string
        protocol = string
        cidr_ipv4 = string
   }))
   description = "Enter the ports to be allowed in Security group egress rule"
   default = {
     All_allow = {
        port = "0"
        protocol = "-1"
        cidr_ipv4 = "0.0.0.0/0"
   }
   }
}

variable "custom_tags" {
  type = map(string)
  description = "Define the common tags for network resource"
  default = {
    "ManagedBy" = "Terraform"
  }
}
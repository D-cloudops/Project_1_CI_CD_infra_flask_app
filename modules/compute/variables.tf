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
   type = map(string)
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
   type = map(string)
   description = "Enter the ports to be allowed in Security group egress rule"
   default = {
     All_allow = {
        port = ""
        protocol = "-1"
        cidr_ipv4 = "0.0.0.0/0"
   }
   }
}



variable "cidr_ipv4" {
  type = string
  description = "CIDR block to allow ingress traffice from"
}


#########Intance variables################

variable "instance_name" {
  type = string
  description = "Name of EC2 instance"
}

variable "ami_id" {
    type = string 
    description = "AMI ID of ec2 instance"
    default = "${data.aws_ami.amazon_linux_2.id}"
}

variable "assign_public_ip" {
  type = bool
  description = "Select to assign public IP or not"
}

variable "instance_type" {
  type = string
  default = "t3.medium"
}

variable "public_key" {
  type = string
  description = "Enter the public key for SSH"
}

variable "subnet_id" {
  type = string
  description = "Enter the subnet ID to launch the instance"
}

variable "user_data" {
  type = string
  description = "Enter the location of userdata file using file fucntion "
}


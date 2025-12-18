#########Intance variables################

variable "custom_tags" {
  type = map(string)
  description = "Define the common tags for network resource"
  default = {
    "ManagedBy" = "Terraform"
  }
}

variable "ec2_key_pair_name" {
  type = string
  description = "Name of key pair"
  default = "Jenkins_instance_key"
}

variable "instance_name" {
  type = string
  description = "Name of EC2 instance"
}

variable "ami_id" {
    type = string 
    description = "AMI ID of ec2 instance"
}

variable "assign_public_ip" {
  type = bool
  description = "Select to assign public IP or not"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "public_key" {
  type = string
  description = "Enter the public key for SSH"
}

variable "subnet_id" {
  type = string
  description = "Enter the subnet ID to launch the instance"
}

variable "ec2_sg_id" {
  type = list(string)
  description = "List of security group ID" 
}

variable "user_data" {
  type = string
  description = "Enter the location of userdata file using file fucntion "
}


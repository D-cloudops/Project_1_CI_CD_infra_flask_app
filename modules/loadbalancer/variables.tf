variable "target_group_name" {
   type =string
   description = "Enter the name of the LB target group"
}

variable "target_group_port" {
  type = string
}

variable "custom_tags" {
  type = map(string)
  description = "Define the common tags for network resource"
  default = {
    "ManagedBy" = "Terraform"
  }
}


variable "vpc_id" {
  type = string
  description = "Enter the VPC ID under which create a Load balancer"
}

variable "instance_id" {
  type = string
  description = "Enter the instance ID of the target instance"
}

variable "lb_name" {
  type = string
  description = "Enter the load balancer name"
}

variable "lb_sg_id" {
  type = list(string)
  description = "SG ID for the load balancer"
}

variable "lb_subnet_id" {
  type = list(string)
  description = "List of subnet ID"
}

variable "target_group_port" {
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

variable "lb_listener_port" {
  type = string
  description = "Port LB listner"
  default = "80"
}

variable "lb_listener_protocol" {
    type = string
    description = "Protocol for LB listner"
    default = "HTTP"
}


/*
variable "lb_accesslog_bucket" {
  type = string
  description = "Bucket name for alb access logs"
}



variable "lb_certificate_arn" {
  type = string 
  description = "ARN for SSL certificate"
}
*/



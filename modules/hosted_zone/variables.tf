variable "domain_name" {
  type = string
  description = "Name of domain"
}

variable "custom_tags" {
   type = map(string)
   description = "Tags to the resources"
   default = {
    ManagedBy = "Terraform"
   }
}

variable "record_sub_domain" {
  type = string
  description = "sub-domain to add as a record"
}

variable "lb_dns" {
  type = string
  description = "DNS of the load balancer"
}

variable "lb_zone_id" {
  type = string
  description = "Zone ID of load balancer"
}

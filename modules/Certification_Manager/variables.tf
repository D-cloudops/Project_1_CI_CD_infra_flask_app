variable "sub_domain"{
    type = string
    description = "Record domain name to geneate certificate for"
}

variable "zone_id" {
  type = string
  description = "Zone ID for the hosted zone"
}
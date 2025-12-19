output "vpc_id" {
  value = module.vpc_network.vpc_id
}

output "public_subnet_id" {
 value = module.vpc_network.public_subnet_id 
}

output "private_subnet_id" {
  value = module.vpc_network.private_subnet_cidr
}

output "alb_id" {
  value = module.jenkins_lb.aws_lb_id
}

output "alb_arn" {
  value = module.jenkins_lb.aws_lb_arn
}

output "alb_dns" {
  value = module.jenkins_lb.aws_lb_dns
}

output "alb_zone_id" {
  value = module.jenkins_lb.aws_lb_zone_id
}

output "name_servers_record" {
  value = module.jenkins_hosted_zone.name_servers_record
}

output "hosted_zone_ID" {
  value = module.jenkins_hosted_zone.hosted_zone_ID
}

output "certificate_arn" {
  value = module.ssl_certificate.certificate_arn
}


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
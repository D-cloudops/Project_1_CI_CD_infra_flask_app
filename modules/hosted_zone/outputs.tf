output "hosted_zone_arn" {
  value = aws_route53_zone.dcloudops_space.arn
}

output "hosted_zone_ID" {
  value = aws_route53_zone.dcloudops_space.zone_id
}

output "name_servers_record" {
  value = aws_route53_zone.dcloudops_space.name_servers
}
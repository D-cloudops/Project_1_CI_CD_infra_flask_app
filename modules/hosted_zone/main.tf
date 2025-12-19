resource "aws_route53_zone" "dcloudops_space" {
  name = var.domain_name
  tags = var.custom_tags
}

resource "aws_route53_record" "dcloudops_records" {
  zone_id = aws_route53_zone.dcloudops_space.zone_id
  name    = var.record_sub_domain
  type    = "A"

  alias {
    name                   = var.lb_dns
    zone_id                = var.lb_zone_id
    evaluate_target_health = true
  }
}
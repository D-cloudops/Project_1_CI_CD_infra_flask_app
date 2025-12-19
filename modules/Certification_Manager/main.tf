resource "aws_acm_certificate" "domain_cert" {
  domain_name       = var.sub_domain
  validation_method = "DNS"

  validation_option {
    domain_name       = "testing.example.com"
    validation_domain = "example.com"
  }
}
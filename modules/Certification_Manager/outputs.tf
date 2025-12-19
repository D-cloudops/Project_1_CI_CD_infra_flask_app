output "certificate_id" {
  value = aws_acm_certificate.domain_cert.id
}

output "certificate_arn" {
  value = aws_acm_certificate.domain_cert.arn
}

output "certificate_validation_arn" {
  value = aws_acm_certificate_validation.cert_validation.certificate_arn
}
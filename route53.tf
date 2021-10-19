resource "aws_route53_zone" "domain" {
  name = var.domain_name
}

resource "aws_route53_record" "websiteurl" {
  name    = var.endpoint
  zone_id = aws_route53_zone.domain.zone_id
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.cf.domain_name
    zone_id                = aws_cloudfront_distribution.cf.hosted_zone_id
    evaluate_target_health = true
  }
}

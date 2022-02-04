data "aws_route53_zone" "mydomain" {
  name         = "lhindtc.link"
}

output "name" {
  description = "The Zone ID of Route53"
  value       = data.aws_route53_zone.mydomain.name
}

output "id" {
  description = "The Zone ID of Route53"
  value       = data.aws_route53_zone.mydomain.zone_id
}

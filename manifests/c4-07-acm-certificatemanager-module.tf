module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "3.3.0"

  domain_name  = trimsuffix(data.aws_route53_zone.mydomain.name, ".")
  zone_id      = data.aws_route53_zone.mydomain.id


#for example: app1.lhindtc.link, app2.lhindtc.link, etc..
  subject_alternative_names = [
    #"*.lhindtc.link"
    var.appurl  #because one link can only create one unique certificate
  ]

  tags = local.common_tags
}

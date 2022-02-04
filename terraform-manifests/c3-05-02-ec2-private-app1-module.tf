//Terraform Private EC2 module

module "ec2-instance_private_app1" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  depends_on                  = [module.vpc]
  name                        = "app1-private-${local.environment}"
  ami                         = data.aws_ami.amzlinux2.id
  instance_count              = var.private_instance_count
  #monitoring                 = true
  instance_type               = var.instance_type_private
  key_name                    = var.kpname
  subnet_ids                  = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  user_data                   = file("${path.module}/userdata-app1.sh")
  vpc_security_group_ids      = [module.security-group-privateec2.security_group_id]
  tags                        = local.common_tags

}

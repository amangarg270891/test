//Terraform Private EC2 module

module "ec2-instance_private_app3" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  depends_on                  = [module.vpc]
  name                        = "app3-private-${local.environment}"
  ami                         = data.aws_ami.amzlinux2.id
  instance_count              = var.private_instance_count
  #monitoring                 = true
  instance_type               = var.instance_type_private
  key_name                    = var.kpname
  subnet_ids                  = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  #user_data                  = file("${path.module}/app3-ums-install.tmpl") #this wont work since the userdata contains a variable that needs to be replaced dynamically
  user_data                   = templatefile("userdata-app3-ums-install.tmpl",{rds_db_endpoint = module.rdsdb.db_instance_address})
  vpc_security_group_ids      = [module.security-group-privateec2.security_group_id]
  tags                        = local.common_tags

}


#to connect to the app installed on these EC2 instances:
#step 1: use the alb or route53 link
#step 2: username: admin101; password: password101

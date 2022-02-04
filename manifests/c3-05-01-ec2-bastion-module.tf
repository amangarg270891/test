//Terraform Bastion EC2 module

module "ec2-instance_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  depends_on                  = [module.vpc]
  name                        = "bastion-${local.environment}"
  ami                         = data.aws_ami.amzlinux2.id
  #instance_count             = 1
  #monitoring                 = true
  instance_type               = var.instance_type_bastion
  key_name                    = var.kpname
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.security-group-bastion.security_group_id]
  user_data                   = file("${path.module}/userdata-bastion-mysql.sh")
  tags                        = local.common_tags

}

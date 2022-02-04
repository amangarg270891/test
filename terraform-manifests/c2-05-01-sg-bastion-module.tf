# Create SG Bastion Terraform Module
module "security-group-bastion" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"


  # VPC Basic Details
  name = "${local.environment}-bastion-sg"
  description = "Security group from 0.0.0.0/0 to port 80"
  vpc_id = module.vpc.vpc_id


  //Ingress Rules
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  //Egress Rules
  egress_rules = ["all-all"]

  tags = local.common_tags

}

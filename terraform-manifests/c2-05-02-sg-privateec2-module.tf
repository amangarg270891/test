########## Create SG Private EC2 Terraform Module

module "security-group-privateec2" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  ########## VPC Basic Details
  name = "${local.environment}-privateec2-sg"
  description = "Security group from bastion-sg to port 22 and 80"
  vpc_id = module.vpc.vpc_id


  ########## Ingress Rules - only allow VPC resources to access the private EC2 instances
  ingress_rules = ["ssh-tcp", "http-80-tcp", "http-8080-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  //Egress Rules
  egress_rules = ["all-all"]

 tags = local.common_tags

}

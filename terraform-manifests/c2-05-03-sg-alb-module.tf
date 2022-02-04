########## Create SG Private EC2 Terraform Module

module "security-group-alb" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  ########## VPC Basic Details
  name = "${local.environment}-alb-sg"
  description = "Security group from alb to the world"
  vpc_id = module.vpc.vpc_id

  # Ingress Rules & CIDR Blocks
  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  //Egress Rules
  egress_rules = ["all-all"]

 tags = local.common_tags


   # Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
   ingress_with_cidr_blocks = [
     {
       from_port   = 81
       to_port     = 81
       protocol    = 6
       description = "Allow Port 81 from internet"
       cidr_blocks = "0.0.0.0/0"
     },
   ]

}
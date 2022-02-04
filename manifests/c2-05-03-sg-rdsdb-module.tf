########## Create SG Private EC2 Terraform Module

module "security-group-rdsdb" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  ########## VPC Basic Details
  name = "${local.environment}-rdsdb-sg"
  description = "Security group for RDS in DB Subnet"
  vpc_id = module.vpc.vpc_id

  # Ingress Rules & CIDR Blocks
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]

  //Egress Rules
  egress_rules = ["all-all"]

 tags = local.common_tags


}

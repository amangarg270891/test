# Terraform variables
aws_region = "eu-west-1"
environment = "stag"
business_unit = "Technology Consulting"

# ALB variables
app1_dns_name = "app1.lhindtc.link"
app2_dns_name = "app2.lhindtc.link"
app3_dns_name = "app3.lhindtc.link"


# RDS DB variables
db_name = "${local.environment}-webappdb"
db_instance_identifier = "${local.environment}-webappdb"
db_username = "dbadmin"
db_password = "Password711"

#EC2 Variables
instance_type_bastion = "t3.small"
instance_type_private = "t3.small"
kpname = "ammykpireland"
private_instance_count = 2

#Route53 DNS Registration
appurl = "app-stag.lhindtc.link"


#VPC Variables
vpc_name = "myvpc-stag"
vpc_cidr_block = "15.0.0.0/16"
vpc_availability_zones = ["eu-west-1a", "eu-west-1b"]
vpc_public_subnets = ["15.0.101.0/24", "15.0.102.0/24"]
vpc_private_subnets = ["15.0.1.0/24", "15.0.2.0/24"]
vpc_database_subnets= ["15.0.151.0/24", "15.0.152.0/24"]
vpc_create_database_subnet_group = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway = true
single_nat_gateway = true


# destroy
#terraform apply -input=false -var-file=stag.tfvars -auto-approve

# destroy
#terraform destroy -input=false -var-file=stag.tfvars -auto-approve

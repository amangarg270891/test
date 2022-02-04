# Terraform variables
aws_region = "eu-west-1"
environment = "dev"
business_unit = "Technology Consulting"

# ALB variables
app1_dns_name = "app1.lhindtc.link"
app2_dns_name = "app2.lhindtc.link"
app3_dns_name = "app3.lhindtc.link"


# RDS DB variables
db_name = "webappdbdev"
db_instance_identifier = "webappdev"
db_username = "dbadmin"
db_password = "Password711"

#EC2 Variables
instance_type_bastion = "t3.micro"
instance_type_private = "t3.micro"
kpname = "ammykpireland"
private_instance_count = 2

#Route53 DNS Registration
appurl = "app-dev.lhindtc.link"


#VPC Variables
vpc_name = "myvpc-dev"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zones = ["eu-west-1a", "eu-west-1b"]
vpc_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_database_subnets= ["10.0.151.0/24", "10.0.152.0/24"]
vpc_create_database_subnet_group = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway = true
single_nat_gateway = true



# destroy
#terraform apply -input=false -var-file=dev.tfvars -auto-approve

# destroy
#terraform destroy -input=false -var-file=dev.tfvars -auto-approve

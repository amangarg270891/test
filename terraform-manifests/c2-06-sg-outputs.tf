########## SG Bastion Output Values ##########

output "security_group_id_bastion" {
  description = "The ID of the security group for Bastion"
  value       = module.security-group-bastion.security_group_id
}

output "security_group_vpc_id_bastion" {
  description = "The VPC ID"
  value       = module.security-group-bastion.security_group_vpc_id
}

output "security_group_name_bastion" {
  description = "The name of the security group"
  value       = module.security-group-bastion.security_group_name
}


########## SG Private SG Output Values ##########

output "security_group_id_privateec2" {
  description = "The ID of the security group for Bastion"
  value       = module.security-group-privateec2.security_group_id
}

output "security_group_vpc_id_privateec2" {
  description = "The VPC ID"
  value       = module.security-group-privateec2.security_group_vpc_id
}

output "security_group_name_privateec2" {
  description = "The name of the security group"
  value       = module.security-group-privateec2.security_group_name
}

########## SG ALB Output Values ##########

output "security_group_id_alb" {
  description = "The ID of the security group for ALB"
  value       = module.security-group-alb.security_group_id
}

output "security_group_vpc_id_alb" {
  description = "The VPC ID"
  value       = module.security-group-alb.security_group_vpc_id
}

output "security_group_name_alb" {
  description = "The name of the ALB security group"
  value       = module.security-group-alb.security_group_name
}

########## SG RDSDB Output Values ##########

output "security_group_id_rdsdb" {
  description = "The ID of the security group for RDSDB"
  value       = module.security-group-rdsdb.security_group_id
}

output "security_group_vpc_id_rdsdb" {
  description = "The VPC ID"
  value       = module.security-group-rdsdb.security_group_vpc_id
}

output "security_group_name_rdsdb" {
  description = "The name of the RDSDB security group"
  value       = module.security-group-rdsdb.security_group_name
}

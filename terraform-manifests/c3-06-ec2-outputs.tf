#outputs for ec2 instances

###### Bastion EC2 ######

output "bastion_ip" {
  description = "Public IP"
  value       = module.ec2-instance_bastion.public_ip
}

output "bastion_id" {
  description = "Public ID"
  value       = module.ec2-instance_bastion.id
}



###### private EC2 App 1######

output "private_ip_app1" {
  description = "private IP"
  value       = module.ec2-instance_private_app1.private_ip
}

output "private_id_app1" {
  description = "private ID"
  value       = module.ec2-instance_private_app1.id
}

###### private EC2 App 2######

output "private_ip_app2" {
  description = "private IP"
  value       = module.ec2-instance_private_app2.private_ip
}

output "private_id_app2" {
  description = "private ID"
  value       = module.ec2-instance_private_app2.id
}

###### private EC2 App 3######

output "private_ip_app3" {
  description = "private IP"
  value       = module.ec2-instance_private_app3.private_ip
}

output "private_id_app3" {
  description = "private ID"
  value       = module.ec2-instance_private_app3.id
}

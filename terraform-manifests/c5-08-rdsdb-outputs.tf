output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.rdsdb.db_instance_address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.rdsdb.db_instance_arn
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.rdsdb.db_instance_endpoint
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = module.rdsdb.db_instance_id
}

output "db_instance_name" {
  description = "The database name"
  value       = module.rdsdb.db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = module.rdsdb.db_instance_username
  sensitive   = true
}

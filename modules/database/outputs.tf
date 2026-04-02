output "db_name" {
  description = "Generated database name"
  value       = random_pet.db_name.id
}

output "db_port" {
  description = "Database port"
  value       = random_integer.db_port.result
}

output "db_password" {
  description = "Database password"
  value       = random_password.db_password.result
  sensitive   = true
}

output "db_connection" {
  description = "Database connection string"
  value       = "${random_pet.db_name.id}:${random_integer.db_port.result}"
}

output "server_name" {
  description = "Generated server name"
  value       = random_pet.server.id
}

output "port" {
  description = "Generated port number"
  value       = random_integer.port.result
}

output "connection_string" {
  description = "Full connection string"
  value       = "${random_pet.server.id}:${random_integer.port.result}"
}

output "deploy_info" {
  description = "Deployment summary"
  value       = "Server ${random_pet.server.id} deployed in ${var.environment} on port ${random_integer.port.result}"
}

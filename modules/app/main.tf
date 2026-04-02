variable "app_name" {
  description = "Application name"
  type        = string
  default     = "myapp"
}

variable "server_address" {
  description = "Server connection string from server module"
  type        = string
}

variable "db_address" {
  description = "Database connection string from database module"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "unknown"
}

variable "replicas" {
  description = "Number of app replicas"
  type        = number
  default     = 1
}

resource "random_id" "deploy_id" {
  byte_length = 4
}

resource "null_resource" "app_deploy" {
  triggers = {
    deploy_id = random_id.deploy_id.hex
  }

  provisioner "local-exec" {
    command = "echo 'App ${var.app_name} deployed in ${var.environment}: server=${var.server_address}, db=${var.db_address}, replicas=${var.replicas}, deploy_id=${random_id.deploy_id.hex}'"
  }
}

output "app_url" {
  value = "https://${var.app_name}-${random_id.deploy_id.hex}.${var.environment}.internal"
}

output "deploy_summary" {
  value = "App=${var.app_name} Server=${var.server_address} DB=${var.db_address} Replicas=${var.replicas}"
}

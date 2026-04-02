resource "random_pet" "server" {
  length    = var.name_length
  separator = var.separator
}

resource "random_integer" "port" {
  min = var.port_min
  max = var.port_max
}

resource "null_resource" "deploy" {
  triggers = {
    server = random_pet.server.id
  }

  provisioner "local-exec" {
    command = "echo 'Terragrunt deployed: ${random_pet.server.id} on port ${random_integer.port.result} in ${var.environment}'"
  }
}

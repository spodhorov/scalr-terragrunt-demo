include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/app"
}

dependency "server" {
  config_path = "../server"

  mock_outputs = {
    connection_string = "mock-server:0000"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

dependency "database" {
  config_path = "../database"

  mock_outputs = {
    db_connection = "mock-db:0000"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

inputs = {
  app_name       = "webapp"
  server_address = dependency.server.outputs.connection_string
  db_address     = dependency.database.outputs.db_connection
  environment    = "dev"
  replicas       = 2
}

include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/app"
}

dependency "server" {
  config_path = "../server"

  mock_outputs = {
    server_name       = "mock-server"
    port              = 0
    connection_string = "mock-server:0000"
    deploy_info       = "mock"
  }
}

dependency "database" {
  config_path = "../database"

  mock_outputs = {
    db_name       = "mock-db"
    db_port       = 0
    db_password   = "mock"
    db_connection = "mock-db:0000"
  }
}

inputs = {
  app_name       = "webapp"
  server_address = dependency.server.outputs.connection_string
  db_address     = dependency.database.outputs.db_connection
  environment    = "dev"
  replicas       = 2
}

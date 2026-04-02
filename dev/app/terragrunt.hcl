terraform {
  source = "../../modules/app"
}

dependency "server" {
  config_path = "../server"
}

dependency "database" {
  config_path = "../database"
}

inputs = {
  app_name       = "webapp"
  server_address = dependency.server.outputs.connection_string
  db_address     = dependency.database.outputs.db_connection
  environment    = "dev"
  replicas       = 2
}

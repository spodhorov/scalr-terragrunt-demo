include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/database"
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

inputs = {
  name_length     = 2
  password_length = 24
  environment     = "dev"
}

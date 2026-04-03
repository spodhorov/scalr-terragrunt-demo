include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/database"
}

dependency "server" {
  config_path = "../server"

  mock_outputs = {
    connection_string = "mock-server:0000"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

inputs = {
  name_length     = 2
  password_length = 24
  environment     = "dev"
}

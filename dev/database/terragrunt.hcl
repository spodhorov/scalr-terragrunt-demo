terraform {
  source = "../../modules/database"
}

dependency "server" {
  config_path = "../server"
}

inputs = {
  name_length     = 2
  password_length = 24
  environment     = "dev"
}

terraform {
  source = "../../modules/server"
}

inputs = {
  name_length = 3
  port_min    = 4000
  port_max    = 5000
  environment = "dev"
}

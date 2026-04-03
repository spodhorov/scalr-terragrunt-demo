include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/server"
}

inputs = {
  name_length = 3
  separator   = "-"
  port_min    = 4000
  port_max    = 5000
  environment = "dev"
}

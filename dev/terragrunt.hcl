# =============================================================
# Terragrunt config for dev environment
# Points to shared module, provides dev-specific inputs
# =============================================================

terraform {
  source = "../modules/server"
}

# Dev-specific inputs — only VALUES differ per environment
inputs = {
  name_length = 3
  separator   = "-"
  port_min    = 4000
  port_max    = 5000
  environment = "dev"
}

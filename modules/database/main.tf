resource "random_pet" "db_name" {
  length    = var.name_length
  separator = "_"
}

resource "random_password" "db_password" {
  length  = var.password_length
  special = true
}

resource "random_integer" "db_port" {
  min = 5432
  max = 5499
}

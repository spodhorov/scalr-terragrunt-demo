variable "name_length" {
  description = "Number of words in database name"
  type        = number
  default     = 2
}

variable "password_length" {
  description = "Database password length"
  type        = number
  default     = 20
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "unknown"
}

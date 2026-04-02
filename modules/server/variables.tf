variable "name_length" {
  description = "Number of words in server name"
  type        = number
  default     = 2
}

variable "separator" {
  description = "Separator between words"
  type        = string
  default     = "-"
}

variable "port_min" {
  description = "Minimum port number"
  type        = number
  default     = 3000
}

variable "port_max" {
  description = "Maximum port number"
  type        = number
  default     = 9999
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "unknown"
}

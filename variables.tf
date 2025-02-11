variable "location" {
  type        = string
  description = "The location/region where the resources will be created"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}

variable "env" {
  type        = string
  description = "environment"
  validation {
    condition     = contains(["dev", "pre", "pro"], var.env)
    error_message = "El valor debe ser 'dev', 'pre' o 'pro'."
  }
}

variable "pepe" {}

variable "resource_groups" {}

variable "test3" {}

variable "develop" {}
# -----------------------------------------------------------------------------
# Azure auth - service principal - autentifikacia do azure
# -----------------------------------------------------------------------------

variable "subscription_id" {}

variable "tenant_id" {}

variable "client_id" {}

variable "client_secret" {}

# -----------------------------------------------------------------------------
# Globalne nastavenia projektu
# -----------------------------------------------------------------------------

variable "location" {
  description = "Pouzije sa na vytvorenie resource_group, ostatne resouces dedia tieto nastavenia."
  default     = "northeurope"
}

variable "resource_group" {
  description = "Nazov resource groupy"
  default     = "fsa24-rsvistula"
}

variable "environment" {
  description = "Identifikator prostredia."
  default     = "qa"
}

variable "resource_name" {
  description = "Nazov resource"
  default     = "fsa24-rsvistula"
}

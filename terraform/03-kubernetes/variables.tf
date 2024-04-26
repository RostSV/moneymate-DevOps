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

variable "dns_prefix" {
  description = "DNS prefix pre AKS"
  default     = "fsa24-rsvistula"
}

variable "resource_name" {
  description = "Nazov resource"
  default     = "fsa24-rsvistula"
}

variable "nodepool_name" {
  description = "Nazov node"
}

variable "node_count" {
  description = "Pocet nodov"
  default     = 1
}

variable "vm_size" {
  description = "Velkost VM"
  default     = "Standard_B2s"
}

variable "os_disk_size" {
  description = "Velkost OS disku"
}

# variable "k8s_sp_client_id" {
#   description = "Meno admina"
# }

# variable "k8s_sp_client_secret" {
#   description = "Heslo admina"
# }

resource "azurerm_container_registry" "fsa_rsvistula" {
  name                   = "${var.resource_name}${var.registry_name}"
  resource_group_name    = var.resource_group
  location               = var.location
  sku                    = "Standard"
  admin_enabled          = true
  anonymous_pull_enabled = "false"


  tags = {
    environment = var.environment
  }
}

resource "azurerm_container_registry_scope_map" "fsa_rsvistula_sm" {
  name                    = "${var.resource_name}-scope-map"
  container_registry_name = azurerm_container_registry.fsa_rsvistula.name
  resource_group_name     = var.resource_group
  actions = [
    "repositories/fsa/content/read",
    "repositories/fsa/content/write"
  ]
}

resource "azurerm_container_registry_token" "fsa_rsvistula_acr_token" {
  name                    = "${var.resource_name}registrytoken"
  container_registry_name = azurerm_container_registry.fsa_rsvistula.name
  resource_group_name     = var.resource_group
  scope_map_id            = azurerm_container_registry_scope_map.fsa_rsvistula_sm.id
}

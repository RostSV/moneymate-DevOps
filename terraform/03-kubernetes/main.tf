resource "azurerm_kubernetes_cluster" "fsa_rsvistula" {
  name                = "${var.resource_name}-aks"
  location            = var.location
  resource_group_name = var.resource_group
  node_resource_group = "mc_fsa-aks"
  dns_prefix         = "${var.dns_prefix}-k8s"
  kubernetes_version = 1.28

  default_node_pool {
    name            = var.nodepool_name
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size
  }
  
  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = var.environment
  }
}
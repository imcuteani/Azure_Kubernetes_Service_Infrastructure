# Azure Resource Group 

resource "azurerm_resource_group" "example" {
  name     = var.resource_group
  location = var.location

}

resource "azurerm_kubernetes_cluster" "example" {
  name                = var.az_aks_cluster_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    enable_auto_scaling = true 
    max_count = 8
    min_count = 1

  }
  auto_scaler_profile {
    
  }
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "example" {
  name                  = var.az_aks_cluster_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.example.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1

  tags = {
    "environment" = "development"
  }
}
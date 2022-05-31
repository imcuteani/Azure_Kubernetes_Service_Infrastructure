# Create Azure Resource Group
resource "azurerm_resource_group" "example" {
  name     = var.Resource_group
  location = var.location
  tags = {
    "env" = "dev"
  }
}

# Create Azure Kubernetes Cluster (AKS)
resource "azurerm_kubernetes_cluster" "example" {
  name                = var.az_aks_cluster_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "techademy"
  open_service_mesh_enabled = true
   



  default_node_pool {
    name                = "techademy"
    node_count          = 1
    vm_size             = "Standard_D2_V2"
    enable_auto_scaling = true

  }


  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "development"
    Cost-center = "1000-11990"
  }
  # Kubernetes cluster channel upgrade (in preview currently)

  # automatic_channel_upgrade = "stable"


}
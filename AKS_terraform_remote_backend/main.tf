# Generate terraform resource group 

resource "azurerm_resource_group" "example" {
  name     = var.resource_group
  location = var.location
  tags = {
    "env" = "dev"
  }
}

resource "random_id" "log_analytics_workspace_name" {
  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "example" {
  name = var.log_analytics_workspace_name
  location = var.log_analytics_workspace_location
  resource_group_name = azurerm_resource_group.example.name
  sku = var.log_analytics_workspace_sku
}

resource "log_analytics_solution" "example" {
  solution_name = var.solution_name
  location = azurerm_log_analytics_workspace.example.location
  resource_group_name = azurerm_resource_group.example.name
  workspace_resource_id = azurerm_log_analytics_workspace.example.id
  workspace_name = azurerm_log_analytics_workspace.example.name

  plan {
      publisher = "Microsoft"
      product = "OMSGallery/ContainerInsights"
  }

}

resource "azurerm_kubernetes_cluster" "example" {
  name = var.az_aks_cluster_name
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix = var.dns_prefix 
  linux_profile {
    admin_username = var.admin_username

    ssh_key{
        key_data = file(var.ssh_public_key)
    }
    
  }
  default_node_pool {
    name  = "agentpool"
    node_count = var.agent_count
    vm_size = "Standard_D2_v2"
  }
  service_principal {
    client_id = var.client_id
    client_secret = var.client_secret
  }
  addon_profile{
        oms_agent{
            enabled = true
            log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
        }
    }
    network_profile{
        load_balancer_sku = "Standard"
        network_profile = "kubenet"
    }
    tags = {
        Environment = "development"
    }
}
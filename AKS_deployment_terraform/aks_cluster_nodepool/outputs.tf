output "az_aks_cluster_id" {
  value = azurerm_kubernetes_cluster.example.id
}

output "az_aks_cluster_node_pool_id" {
  value = azurerm_kubernetes_cluster_node_pool.example.id
}
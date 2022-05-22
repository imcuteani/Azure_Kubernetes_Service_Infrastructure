#output AKS Cluster Id
output "azurerm_kubernetes_cluster_id" {
  value = azurerm_kubernetes_cluster.example.id

}
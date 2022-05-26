variable "subscription_id" {
  type        = string
  description = "The Subscription Id for Azure account"
}

variable "client_id" {
  type        = string
  description = "The Client Id of the service principal"
}

variable "client_secret" {
  type        = string
  description = "The client secret of the service pricipal"
}

variable "tenant_id" {
  type        = string
  description = "the tenant Id of the directory"
}

variable "resource_group" {
  type        = string
  description = "The resource group of Azure Kubernetes resource"
}

variable "location" {
  type        = string
  description = "The location of the resource group"
}

variable "az_aks_cluster_name" {
  type        = string
  description = "The AKS cluster name"
}

variable "aks_dns_prefix" {
  type        = string
  description = "The AKS DNS prefix"
}

variable "az_aks_cluster_node_pool_name" {
  type        = string
  description = "The AKS Cluster node pool name"
}

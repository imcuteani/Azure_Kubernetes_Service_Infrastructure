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

variable "log_analytics_workspace_name" {
  type = string
  description = "The log analytics workspace name"
}

variable "log_analytics_workspace_sku" {
  type = string
  default = "PerGB2018"
  description = "The log analytics workspace sku"
}

variable "log_analytics_workspace_location" {
  type = string
  default = "eastasia"
  description = "The log analytics workspace location"

}
variable "agent_count" {
  default = 3
}
variable "solution_name" {
  type = string
  description = "The log analytics solution name"
}

variable "az_aks_cluster_name" {
  type = string
  description = "The Azure AKS cluster name"
}

variable "dns_prefix" {
  type = string
  description = "The DNS prefix of the cluster"
}

variable "ssh_public_key" {
  type = string
  default = "~/.ssh/id_rsa.pub"
  description = "The ssh public key required for AKS cluster"
}

variable "admin_username" {
  type = string
  default = "ubuntu"
  description = "The admin username of the Linux node pool"
}

variable "storage_account_rg" {
  type = string
  description = "The storage account resource group"
}

variable "storage_account_name" {
  type = string
  description = "The storage account name"
}

variable "container_name" {
  type = string
  description = "The container name of the storage account"
}

variable "storage_key" {
  type = string
  description = "The storage account key"
}
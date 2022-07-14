#Terraform backend declaration 
terraform {
    backend "s3" {
      bucket = "techademy"
      key = "terraform"
      region = "us-east-1"
      encrypt = true
      dynamodb_table = "techademy"
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.74"
    }
  }
}


# Terraform Providers declaration
provider "azurerm" {
  version = "~>2.0"
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

}
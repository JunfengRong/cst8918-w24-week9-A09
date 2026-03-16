

terraform {
  required_version = ">= 1.0.0" 

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "example" {
  name     = "storage-rg"
  location = "East US"
}


resource "azurerm_storage_account" "example" {
  name                     = "mystorageacct"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
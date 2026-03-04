

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-dev"
  location = "UK South"
}

terraform {
  backend "azurerm" {}

  }




resource "azurerm_storage_account" "sa" {
  name                     = "stosdsrtname"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

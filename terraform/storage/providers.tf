terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  backend "azurerm" {
    resource_group_name = "terraform-state"
    storage_account_name = "terraformstate"
    container_name = "terraform-state"
    key = "{var.environment}.tfstate"
    use_azuread_auth = true
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
    features {}
}
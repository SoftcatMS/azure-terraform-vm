terraform {
  required_version = ">=1.0.0"

  # Azurerm Backend https://www.terraform.io/docs/language/settings/backends/azurerm.html#
  backend "azurerm" {
    resource_group_name  = "Terraform-Storage-accountRG"
    storage_account_name = "softcattfmodulestate"
    container_name       = "tf-modules-azure-vm-basic"
    key                  = "terraform.tfstate"
  }

  required_providers {
    # Uncomment required providers and delete unneeded
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Uncomment required providers and delete unneeded

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


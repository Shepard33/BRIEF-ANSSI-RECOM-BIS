# Objectif : Ce fichier est utilisé pour définir les fournisseurs qui seront utilisés dans la configuration Terraform.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.74.0"
    }
    ansible = {
       source = "ansible/ansible"
     }
  }
}
# Définit le fournisseur
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  # subscription_id = local.subscription_id
} 

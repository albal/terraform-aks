terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.23.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.13.1"
    }
  }

  required_version = ">= 0.14"
}


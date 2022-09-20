data "terraform_remote_state" "aks" {
  backend = "local"

  config = {
    path = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_kubernetes_cluster" "default" {
  name                = data.terraform_remote_state.aks.outputs.kubernetes_cluster_name
  resource_group_name = data.terraform_remote_state.aks.outputs.resource_group_name
}

provider "kubernetes" {
  host = data.azurerm_kubernetes_cluster.default.kube_config.0.host

  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
}
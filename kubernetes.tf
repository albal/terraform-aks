provider "azurerm" {
  features {}
}

data "azurerm_kubernetes_cluster" "default" {
  name                = azurerm_kubernetes_cluster.default.name
  resource_group_name = azurerm_kubernetes_cluster.default.resource_group_name
}

provider "kubernetes" {
  host = data.azurerm_kubernetes_cluster.default.kube_config.0.host

  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "AKS-Cluster-rg"
  location = "UK South"

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${var.customer}-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${var.customer}-k8s"

  default_node_pool {
    name            = "${var.customer}nodepool"
    node_count      = 1
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
  }

#  service_principal {
#    client_id     = var.appId
#    client_secret = var.password
#  }


  identity {
    type = "SystemAssigned"
  }
  
  http_application_routing_enabled  = true
  role_based_access_control_enabled = true

  tags = {
    environment = "Demo"
  }
}

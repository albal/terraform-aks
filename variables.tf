variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "customer" {
  description = "Customer name used to identify Cluster"
  default = "dfe"  
}

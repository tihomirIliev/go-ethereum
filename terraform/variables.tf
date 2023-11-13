variable "rg_name" {
  type    = string
  default = "devnet-test"
}
variable "resource_group_location" {
  type        = string
  default     = "northeurope"
  description = "Location of the resource group."
}

variable "azurerm_kubernetes_cluster_name" {
  type    = string
  default = "devnet_cluster"
}
variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 1
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "testuser"
}
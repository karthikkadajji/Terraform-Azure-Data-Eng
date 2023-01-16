variable "location" {
  description = "The Azure Region in which all resources in this project should be created."
  default     = "westeurope"
}

variable "resource_groupname" {
  description = "resource group resource value"
}

variable "datafactoryname" {
  description = "datafactory name"
}

variable "stgkarthikdp203value" {
  description = "storage account id"
}

variable "connectionstring_datafactory" {
  description = "connection string name"
  default = "datafactory_linked_service_connection"
}

variable "destcontainer" {
  description = "The deestination container location"
}
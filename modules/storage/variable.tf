variable "prefix" {
  description = "The prefix which should be used for all resources in this project"
}

variable "location" {
  description = "The Azure Region in which all resources in this project should be created."
}

variable "primary_subscription" {
  description = "Subscription id"
}

variable "storageaccount_name" {
  description = "storage account name"
  default     = "dp203kk"
}

variable "role" {
  description = "role of the user"
  default     = "Contributor"
}

variable "stalocation" {
  description = "The Azure Region in which all storage account in this project should be created."
}

variable "destcontainer" {
  description = "The deestination container location"
}
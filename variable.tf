variable "client_secret" {
  description = "Secret key for the azure subscription"
}

variable "prefix" {
  description = "The prefix which should be used for all resources in this project"
  default     = "DataEngineering"
}

variable "location" {
  description = "The Azure Region in which all resources in this project should be created."
  default     = "westus2"
}

variable "stalocation" {
  description = "The Azure Region in which all storage account in this project should be created."
  default     = "westus2"
}

variable "primary_subscription" {
  default = "primary subcription"
}

variable "storageaccount_name" {
  description = "storage account name"
  default     = "dp203kk"
}

variable "datafactoryname" {
  description = "datafactory name"
  default     = "datafactorydp203kk"
}

variable "resource_groupname" {
  description = "datafactory name"
  default = "datafactorykkdp203"
}
variable "synapseworkspacename" {
  description = "synapse workspace name"
  default     = "synapsekkdp203"
}

variable "tenant_id" {
  description = "tenant id"
}

variable "client_id" {
  description = "client id"
}

variable "destcontainer" {
  description = "destination container name in storage group"
}
variable "client_secret" {
  description = "Secret key for the azure subscription"
}

variable "prefix" {
  description = "The prefix which should be used for all resources in this project"
  default     = "DataEngineering"
}

variable "location" {
  description = "The Azure Region in which all resources in this project should be created."
  default     = "westeurope"
}

variable "stalocation" {
  description = "The Azure Region in which all storage account in this project should be created."
  default     = "westeurope"
}

variable "primary_subscription" {
  description = "primary subcription"
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
  default     = "datafactorykkdp203"
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

variable "principal_id_synapse" {
  description = "principal id for synapse user"
}

variable "tenant_id_synapse" {
  description = "tenant id for synapse user"
}

variable "object_id_synapse" {
  description = "object id for synapse user"
}

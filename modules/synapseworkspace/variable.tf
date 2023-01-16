variable "synapseworkspacename" {
  description = "name of the synampe workspace"
  default = "synapsedataengineeringdp203karthik"
}

variable "location" {
  description = "location"
  default     = "westeurope"
}

variable "sqlpassword" {
  description = "sql password"
  default     = "Karthik12324!"
}

variable "sqlusername" {
  description = "sql username admin"
  default     = "sqladminuser"
}

variable "lakeid" {
  description = "data lake id"
}

variable "resource_groupname" {
  description = "storage group resource value"
}

variable "principal_id_synapse" {
  description = "principal id for synapse user"
}

variable "tenant_id_synapse" {
  description = "tenant id for synapse user"
}

variable "object_id_syapse" {
  description = "object id for synapse user"

}
output "resource_groupname" {
  description = "storage group resource value"
  value       = azurerm_resource_group.rg.name
}

output "rsglocation" {
  description = "storage group resource value"
  value       = azurerm_resource_group.rg.name
}
output "stgkarthikdp203value" {
  description = "storage group resource value"
  value       = azurerm_storage_account.stgkarthikdp203
}

output "lakeid" {
  description = "data lake id"
  value       = azurerm_storage_data_lake_gen2_filesystem.datalake.id
}

output "destcontainer" {
  description = "destination container name in storage group"
  value       = azurerm_storage_container.stgcont.name
}
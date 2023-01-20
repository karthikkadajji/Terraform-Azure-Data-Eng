data "azurerm_client_config" "current" {}

resource "azurerm_synapse_workspace" "synapsede" {
  name                                 = var.synapseworkspacename
  location                             = var.location
  resource_group_name                  = var.resource_groupname
  storage_data_lake_gen2_filesystem_id = var.lakeid
  sql_administrator_login              = var.sqlusername
  sql_administrator_login_password     = var.sqlpassword
  managed_virtual_network_enabled      = false
  public_network_access_enabled        = true

  identity {
    type = "SystemAssigned"
  }

  aad_admin {
    login     = "AzureAD Admin"
    object_id = var.object_id_synapse
    tenant_id = var.tenant_id_synapse
  }

  tags = {
    Env = "staging1"
  }
}

resource "azurerm_synapse_firewall_rule" "allowservicefirewall" {
  name                 = "AllowAllWindowsAzureIps"
  synapse_workspace_id = azurerm_synapse_workspace.synapsede.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "0.0.0.0"
}

resource "azurerm_synapse_firewall_rule" "allowall" {
  name                 = "allowall"
  synapse_workspace_id = azurerm_synapse_workspace.synapsede.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "255.255.255.255"
}


resource "null_resource" "previous" {}

resource "time_sleep" "wait_90_seconds" {
  depends_on = [azurerm_synapse_firewall_rule.allowservicefirewall, null_resource.previous, azurerm_synapse_firewall_rule.allowall]

  create_duration = "90s"
}

resource "azurerm_synapse_role_assignment" "example" {
  synapse_workspace_id = azurerm_synapse_workspace.synapsede.id
  role_name            = "Synapse Administrator"
  principal_id         = var.principal_id_synapse

  depends_on = [time_sleep.wait_90_seconds, azurerm_synapse_firewall_rule.allowservicefirewall, null_resource.previous, azurerm_synapse_firewall_rule.allowall]
}

resource "azurerm_synapse_sql_pool" "dedicatedsqlpool" {
  name                 = "sqlpooldedicated"
  synapse_workspace_id = azurerm_synapse_workspace.synapsede.id
  sku_name             = "DW100c"
  create_mode          = "Default"
}
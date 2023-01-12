resource "azurerm_synapse_workspace" "synapsede" {
  name                                 = var.synapseworkspacename
  location                             = var.location
  resource_group_name                  = var.resource_groupname
  storage_data_lake_gen2_filesystem_id = var.lakeid
  sql_administrator_login              = var.sqlusername
  sql_administrator_login_password     = var.sqlpassword

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Env = "staging1"
  }
}

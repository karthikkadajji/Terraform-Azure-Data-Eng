resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_storage_account" "stgkarthikdp203" {
  name                     = var.storageaccount_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.stalocation
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled = true

  tags = {
    environment = "staging1"
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalake" {
  name               = "datalakedataengineeringdp203karthik"
  storage_account_id = azurerm_storage_account.stgkarthikdp203.id
}

resource "azurerm_storage_container" "containerdp203" {
  name                  = "dataset"
  storage_account_name  = azurerm_storage_account.stgkarthikdp203.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "fileupload" { 
  name                   = "diabetes.csv"
  storage_account_name   = azurerm_storage_account.stgkarthikdp203.name
  storage_container_name = azurerm_storage_container.containerdp203.name
  type                   = "Block"
  source_uri                 = "https://raw.githubusercontent.com/MicrosoftDocs/mslearn-aml-labs/master/data/diabetes.csv"
}

resource "azurerm_storage_container" "stgcont" {
  name                  = var.destcontainer
  storage_account_name  = azurerm_storage_account.stgkarthikdp203.name
  container_access_type = "private"
}
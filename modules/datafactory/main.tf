resource "azurerm_data_factory" "datafactorykk" {
  name                = var.datafactoryname
  location            = var.location
  resource_group_name = var.resource_groupname
}

resource "azurerm_data_factory_linked_custom_service" "linkedservice" {
  name                 = var.connectionstring_datafactory
  data_factory_id      = azurerm_data_factory.datafactorykk.id
  type                 = "AzureBlobStorage"
  type_properties_json = <<JSON
{
  "connectionString": "${var.stgkarthikdp203value.primary_connection_string}"
}
JSON
}

resource "azurerm_data_factory_dataset_delimited_text" "datasetsource" {
  name                = "source"
  data_factory_id     = azurerm_data_factory.datafactorykk.id
  linked_service_name = azurerm_data_factory_linked_custom_service.linkedservice.name

  azure_blob_storage_location {
    container = "dataset"
    filename  = "diabetes.csv"
  }

  column_delimiter    = ","
  row_delimiter       = "NEW"
  encoding            = "UTF-8"
  quote_character     = "x"
  escape_character    = "f"
  first_row_as_header = true
  null_value          = "NULL"
}

resource "azurerm_data_factory_dataset_delimited_text" "datasetsink" {
  name                = "sink"
  data_factory_id     = azurerm_data_factory.datafactorykk.id
  linked_service_name = azurerm_data_factory_linked_custom_service.linkedservice.name

  azure_blob_storage_location {
    container = var.destcontainer
    filename  = "test.csv"
  }

  column_delimiter    = ","
  row_delimiter       = "NEW"
  encoding            = "UTF-8"
  quote_character     = "x"
  escape_character    = "f"
  first_row_as_header = true
  null_value          = "NULL"
}

resource "azurerm_data_factory_data_flow" "dataflow1" {
  name            = "copyfiles"
  data_factory_id = azurerm_data_factory.datafactorykk.id

  source {
    name = "source1"

    dataset {
      name = azurerm_data_factory_dataset_delimited_text.datasetsource.name
    }
  }

  sink {
    name = "sink1"

    dataset {
      name = azurerm_data_factory_dataset_delimited_text.datasetsink.name
    }
  }

  script = <<EOT
source(
  allowSchemaDrift: true, 
  validateSchema: false, 
  limit: 100, 
  ignoreNoFilesFound: false, 
  documentForm: 'documentPerLine') ~> source1 
source1 sink(
  allowSchemaDrift: true, 
  validateSchema: false, 
  skipDuplicateMapInputs: true, 
  skipDuplicateMapOutputs: true) ~> sink1
EOT
}

# create runtime intergration to run the pipeline
resource "azurerm_data_factory_integration_runtime_azure" "runtime" {
  name            = "dataflowcopy"
  data_factory_id = azurerm_data_factory.datafactorykk.id
  location        = var.location
}


# create pipeline for running the dataflowlet

resource "azurerm_data_factory_pipeline" "test" {
  name            = "pipeline2"
  data_factory_id = azurerm_data_factory.datafactorykk.id
  activities_json = <<JSON
[
{
                "name": "copyfiles",
                "type": "ExecuteDataFlow",
                "dependsOn": [],
                "policy": {
                    "timeout": "00:03:00",
                    "retry": 0,
                    "retryIntervalInSeconds": 30,
                    "secureOutput": false,
                    "secureInput": false
                },
                "userProperties": [],
                "typeProperties": {
                    "dataflow": {
                        "referenceName": "copyfiles",
                        "type": "DataFlowReference"
                    },
                    "integrationRuntime": {
                        "referenceName": "dataflowcopy",
                        "type": "IntegrationRuntimeReference"
                    },
                    "traceLevel": "Fine"
                }
            }
]
  JSON
  
  depends_on = [
    azurerm_data_factory_data_flow.dataflow1
  ]
}

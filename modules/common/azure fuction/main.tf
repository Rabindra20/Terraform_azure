resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = var.app_service_plan_location
  resource_group_name = var.app_service_plan_resource_group_name
  kind                = var.app_service_kind
  reserved            = var.app_service_plan_reserved

  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }

#   lifecycle {
#     ignore_changes = [
#       kind
#     ]
#   }
}

resource "azurerm_function_app" "example" {
  name                       = "example-azure-function"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  os_type                    = "linux"
  version                    = "~4"

  app_settings {
    FUNCTIONS_WORKER_RUNTIME = "python"
  }

  site_config {
    linux_fx_version = "python|3.9"
  }
}
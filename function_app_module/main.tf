resource "azurerm_resource_group" "resource_group" {
  name     = var.storage_account_parameters.resource_group_name
  location = var.storage_account_parameters.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_parameters.name
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = var.storage_account_parameters.account_tier
  account_replication_type = var.storage_account_parameters.account_replication_type
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_parameters.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku {
    tier = var.app_service_plan_parameters.sku_tier
    size = var.app_service_plan_parameters.sku_size
  }
}

resource "azurerm_application_insights" "application_insights" {
  name                = var.application_insights_parameters.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  application_type    = var.application_insights_parameters.application_type
}

resource "azurerm_function_app" "function_app" {
  name                       = var.function_app_parameters.name
  location                   = azurerm_resource_group.resource_group.location
  resource_group_name        = azurerm_resource_group.resource_group.name
  app_service_plan_id        = var.function_app_parameters.app_service_plan_id
  storage_account_name       = var.function_app_parameters.storage_account_name
  os_type                    = var.function_app_parameters.os_type
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
}


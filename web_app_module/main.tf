resource "azurerm_resource_group" "web_app_resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_app_service_plan" "web_app_service_plan" {
  name                = "example-app-service-plan"
  resource_group_name = azurerm_resource_group.web_app_resource_group.name
  location            = azurerm_resource_group.web_app_resource_group.location

  sku {
    tier = var.app_service_plan_parameters.pricing_tier
    size = var.app_service_plan_parameters.size
  }
}

resource "azurerm_app_service" "web_app_service" {
  name                = "example-app-service"
  location            = azurerm_resource_group.web_app_resource_group.location
  resource_group_name = azurerm_resource_group.web_app_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.web_app_service_plan.id

  # Assuming other required properties are defined elsewhere in the module
}

resource "azurerm_application_insights" "web_app_insights" {
  name                = "example-app-insights"
  location            = azurerm_resource_group.web_app_resource_group.location
  resource_group_name = azurerm_resource_group.web_app_resource_group.name
  application_type    = var.application_insights_parameters.type
  retention_in_days   = var.application_insights_parameters.retention_in_days
}

resource "azurerm_storage_account" "web_app_storage_account" {
  name                     = "examplestorageaccount"
  resource_group_name      = azurerm_resource_group.web_app_resource_group.name
  location                 = azurerm_resource_group.web_app_resource_group.location
  account_tier             = var.storage_account_parameters.account_tier
  account_replication_type = var.storage_account_parameters.replication_type

  # Assuming other required properties are defined elsewhere in the module
}

resource "azurerm_container_registry" "web_app_container_registry" {
  name                = "examplecontainerregistry"
  resource_group_name = azurerm_resource_group.web_app_resource_group.name
  location            = azurerm_resource_group.web_app_resource_group.location
  sku                 = var.container_registry_parameters.sku
  admin_enabled       = var.container_registry_parameters.admin_enabled

  # Assuming other required properties are defined elsewhere in the module
}



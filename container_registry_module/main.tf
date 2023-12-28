resource "azurerm_resource_group" "container_registry_resource_group" {
  name     = var.container_registry_parameters.resource_group_name
  location = var.container_registry_parameters.location
}

resource "azurerm_container_registry" "container_registry" {
  name                = var.container_registry_parameters.name
  resource_group_name = azurerm_resource_group.container_registry_resource_group.name
  location            = azurerm_resource_group.container_registry_resource_group.location
  sku                 = var.container_registry_parameters.sku
  admin_enabled       = var.container_registry_parameters.admin_enabled
}

resource "azurerm_role_assignment" "acr_role_assignment" {
  principal_id         = var.role_assignment_parameters.principal_id
  role_definition_name = var.role_assignment_parameters.role_definition_name
  scope                = var.role_assignment_parameters.scope
}


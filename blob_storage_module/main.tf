resource "azurerm_resource_group" "blob_storage_module" {
  name     = var.storage_account_parameters.resource_group_name
  location = var.storage_account_parameters.location
}

resource "azurerm_storage_account" "blob_storage_module" {
  name                     = var.storage_account_parameters.name
  resource_group_name      = azurerm_resource_group.blob_storage_module.name
  location                 = azurerm_resource_group.blob_storage_module.location
  account_tier             = var.storage_account_parameters.account_tier
  account_replication_type = var.storage_account_parameters.account_replication_type
}

resource "azurerm_storage_container" "blob_storage_module" {
  for_each = { for container in var.storage_container_parameters : container.name => container }

  name                  = each.value.name
  storage_account_name  = each.value.storage_account_name
  container_access_type = each.value.container_access_type
}


output "function_app_default_hostname" {
  description = "The default hostname of the Function App."
  value       = azurerm_function_app.function_app.default_hostname
}

output "function_app_storage_account_name" {
  description = "The name of the linked storage account for the Function App."
  value       = azurerm_storage_account.storage_account.name
}


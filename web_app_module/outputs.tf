output "app_service_default_hostname" {
  description = "The default hostname of the app service."
  value       = azurerm_app_service.web_app_service.default_site_hostname
}

output "storage_account_primary_blob_endpoint" {
  description = "The primary blob service endpoint of the storage account."
  value       = azurerm_storage_account.web_app_storage_account.primary_blob_endpoint
}

output "container_registry_login_server" {
  description = "The login server for the container registry."
  value       = azurerm_container_registry.web_app_container_registry.login_server
}


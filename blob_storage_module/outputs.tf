output "storage_account_primary_blob_endpoint" {
  description = "The primary blob service endpoint."
  value       = azurerm_storage_account.blob_storage_module.primary_blob_endpoint
}


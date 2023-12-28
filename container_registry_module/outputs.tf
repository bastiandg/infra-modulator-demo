output "container_registry_login_server" {
  description = "The login server URL of the container registry."
  value       = azurerm_container_registry.container_registry.login_server
}


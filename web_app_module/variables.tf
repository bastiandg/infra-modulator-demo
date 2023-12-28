################
# web_app_module
################

# Required parameters

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
}

variable "app_service_plan_parameters" {
  description = "Parameters like pricing tier and size for the app service plan."
  type = object({
    pricing_tier = string
    size         = string
  })
}

variable "application_insights_parameters" {
  description = "Parameters for configuring application insights."
  type = object({
    type              = string
    retention_in_days = number
  })
}

variable "storage_account_parameters" {
  description = "Parameters for creating the storage account."
  type = object({
    account_tier     = string
    replication_type = string
  })
}

variable "container_registry_parameters" {
  description = "Parameters for setting up the container registry."
  type = object({
    sku           = string
    admin_enabled = bool
  })
}



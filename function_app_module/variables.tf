####################
# function_app_module
####################

# Required parameters

variable "function_app_parameters" {
  description = "Parameters for setting up the Function App."
  type = object({
    name                 = string
    resource_group_name  = string
    app_service_plan_id  = string
    storage_account_name = string
    os_type              = string
    // Add additional fields as required based on the exact configuration needed
  })
}

variable "app_service_plan_parameters" {
  description = "Parameters for the App Service plan."
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    sku_tier            = string
    sku_size            = string
    // Add additional fields as required based on the exact configuration needed
  })
}

variable "application_insights_parameters" {
  description = "Configuration parameters for application insights."
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    application_type    = string
    // Add additional fields as required based on the exact configuration needed
  })
}

variable "storage_account_parameters" {
  description = "Parameters for creating the linked storage account."
  type = object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    // Add additional fields as required based on the exact configuration needed
  })
}


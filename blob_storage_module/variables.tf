################
# blob_storage_module
################

# Required parameters

variable "storage_account_parameters" {
  description = "Parameters for the creation of the storage account."
  type = object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  })
}

variable "storage_container_parameters" {
  description = "Parameters for creating storage containers within the account."
  type = list(object({
    name                  = string
    storage_account_name  = string
    container_access_type = string
  }))
}


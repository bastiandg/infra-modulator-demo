variable "container_registry_parameters" {
  description = "Parameters for the container registry."
  type = object({
    resource_group_name = string
    location            = string
    name                = string
    sku                 = string
    admin_enabled       = bool
  })
}

variable "role_assignment_parameters" {
  description = "Parameters for the role assignment."
  type = object({
    principal_id         = string
    role_definition_name = string
    scope                = string
  })
}


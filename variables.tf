variable "environment" {
  description = "(Required) The name of the environment."
  type        = string
  validation {
    condition = contains([
      "dev",
      "test",
      "prod",
    ], var.environment)
    error_message = "Possible values are dev, test, and prod."
  }
}

# This `name` variable is replaced by the use of `system_name` and `environment` variables.
# variable "name" {
#   description = "(Required) The name which should be used for this resource. Changing this forces a new resource to be created."
#   type        = string
# }

variable "system_name" {
  description = "(Required) The systen name which should be used for this resource. Changing this forces a new resource to be created."
  type        = string
}

variable "system_short_name" {
  description = "(Required) The short name."
  type        = string
}

variable "override_name" {
  description = "(Optional) Override the name of the resource. Under normal circumstances, it should not be used."
  default     = null
  type        = string
}

variable "override_location" {
  description = "(Optional) Override the location of the resource. Under normal circumstances, it should not be used."
  default     = null
  type        = string
}

variable "resource_group" {
  description = "(Required) The resource group in which to create the resource."
  type        = any
}

# This `resource_group_name` variable is replaced by the use of `resource_group` variable.
# variable "resource_group_name" {
#   description = "(Required) The name of the resource group where the resource should exist. Changing this forces a new resource to be created."
#   type        = string
# }

# This `location` variable is replaced by the use of `resource_group` variable.
# variable "location" {
#   description = "(Required) The location where the resource should exist. Changing this forces a new resource to be created."
#   type        = string
# }

variable "sku" {
  description = "(Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are `Free`, `PerNode`, `Premium`, `Standard`, `Standalone`, `Unlimited`, `CapacityReservation`, and `PerGB2018` (new SKU as of `2018-04-03`). Defaults to `PerGB2018`. Note that the `Free` SKU has a default `daily_quota_gb` value of `0.5 `(GB)."
  default     = "PerGB2018"
  type        = string
  validation {
    condition     = can(regex("^(Free|PerNode|Premium|Standard|Standalone|Unlimited|CapacityReservation|PerGB2018)$", var.sku))
    error_message = "Possible values are `Free`, `PerNode`, `Premium`, `Standard`, `Standalone`, `Unlimited`, `CapacityReservation`, and `PerGB2018` (new SKU as of `2018-04-03`)."
  }
}

variable "retention_in_days" {
  description = "(Optional) The workspace data retention in days. Possible values are either `7` (Free Tier only) or range between `30` and `730`."
  default     = 30
  type        = number
}

variable "daily_quota_gb" {
  description = "(Optional) The workspace daily quota for ingestion in GB. Defaults to `-1` (unlimited) if omitted."
  default     = -1
  type        = number
}

variable "cmk_for_query_forced" {
  description = "(Optional) Is Customer Managed Storage mandatory for query management?"
  default     = false
  type        = bool
}

variable "internet_ingestion_enabled" {
  description = "(Optional) Should the Log Analytics Workspace support ingestion over the Public Internet? Defaults to `true`."
  default     = true
  type        = bool
}

variable "internet_query_enabled" {
  description = "(Optional) Should the Log Analytics Workspace support querying over the Public Internet? Defaults to `true`."
  default     = true
  type        = bool
}

variable "reservation_capacity_in_gb_per_day" {
  description = "(Optional) The capacity reservation level in GB for this workspace. Must be in increments of `100` between `100` and `5000`. Note: `reservation_capacity_in_gb_per_day` can only be used when the sku is set to `CapacityReservation`."
  default     = null
  type        = number
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
  type        = map(string)
}

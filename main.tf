locals {
  name     = var.override_name == null ? "${var.system_name}-${lower(var.environment)}-log" : var.override_name
  location = var.override_location == null ? var.resource_group.location : var.override_location
}

resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = local.name
  location            = local.location
  resource_group_name = var.resource_group.name

  sku                                = var.sku
  retention_in_days                  = var.retention_in_days
  daily_quota_gb                     = var.daily_quota_gb
  cmk_for_query_forced               = var.cmk_for_query_forced
  internet_ingestion_enabled         = var.internet_ingestion_enabled
  internet_query_enabled             = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  tags                               = var.tags
}

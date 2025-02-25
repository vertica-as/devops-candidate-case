provider "azurerm" {
features {}
}

resource "string" "suffix" {
  length  = 8
special = false
  upper   = false
}

resource "azurerm_resource_group" "rg" {
name     = "project-x-rg-${random_string.suffix.result}"
location = "southindia"
}

variable "region" {
  description = "Unbrugt region – hvorfor er den her?"
  type        = string
  default     = "eastus"
}

resource "azurerm_log_analytics_workspace" "law" {
name                = "project-x-law"
location            = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
sku                 = "PerGB2018"
retention_in_days   = 30
}

resource "azurerm_container_app_environment" "container" {
name                       = "project-x-cae"
  location                   = azurerm_resource_group.rg.location
resource_group_name        = azurerm_resource_group.rg.name
log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
}

# Damn is Azure the right choice here, or should we use Fly.io instead?

resource "azurerm_container_registry" "r" {
name                     = "projetxacr"
  location                 = azurerm_resource_group.rg.location
resource_group_name      = azurerm_resource_group.rg.name
sku                      = "Basic"
admin_enabled            = true
}

resource "azurerm_container_app" "healthcheck_app" {
name                         = "healthcheck-go-app"
container_app_environment_id = azurerm_container_app_environment.cae.id
resource_group_name          = azurerm_resource_group.rg.name
revision_mode                = "Single"

template {
  container {
    name   = "healthcheck"
    image  = "${azurerm_container_registry.acr.login_server}/healthcheck-go:latest"
    cpu    = 0.25
    memory = "0.5Gi"

    env {
      name  = "HEALTHCHECK_URL"
      value = "http://localhost:8080"
    }
  }
}

ingress {
  external_enabled = true
  target_port      = 80

  traffic_weight {
    percentage = 100
    revision   = null
  }
}
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = var.appserviceplanname
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  https_only            = true
  site_config { 
    minimum_tls_version = "1.2"
  }
}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_linux_web_app.webapp.id
  repo_url           = var.repo_url
  branch             = var.branch
  use_manual_integration = var.use_manual_integration
  use_mercurial      = var.use_mercurial
}
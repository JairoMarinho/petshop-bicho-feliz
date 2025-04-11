provider "azurerm" {
  features {}
  subscription_id = "d9908df3-76ce-4786-a03b-9392307fc1fb"
}

resource "azurerm_resource_group" "rg" {
  name     = "petshop-bicho-feliz"
  location = "canadacentral"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "petshop-bicho-feliz-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Basic"
    size = "B1"
  }

  kind     = "Linux"
  reserved = true
}

resource "azurerm_app_service" "app" {
  name                = "petshop-bicho-feliz-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    linux_fx_version = "PYTHON|3.10"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
    "SCM_DO_BUILD_DURING_DEPLOYMENT"      = "true"
  }
}

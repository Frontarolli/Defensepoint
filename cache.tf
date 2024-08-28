resource "azurerm_redis_cache" "redis_cache" {
  name                = "example-redis-cache"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 1
  family              = "C"
  sku_name            = "Standard"
}
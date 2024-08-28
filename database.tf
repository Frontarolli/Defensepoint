resource "azurerm_mssql_server" "mssql_server" {
  name                         = "example-mssqlserver"
  location            = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "AdminPassword123!"
  minimum_tls_version          = "1.2"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_mssql_database" "sql_database" {
  name                = "exampledb"
  server_id           = azurerm_mssql_server.mssql_server.id
  sku_name            = "S1"
}

output "frontdoor_url" {
  value = azurerm_frontdoor.frontdoor.frontend_endpoint[0].host_name
}

output "app_service_url" {
  value = azurerm_linux_web_app.app_service.default_hostname
}

output "sql_connection_string" {
  value = azurerm_mssql_database.sql_database.name
}

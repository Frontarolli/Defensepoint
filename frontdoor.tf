resource "azurerm_frontdoor" "frontdoor" {
  name                = "example-frontdoor"
  resource_group_name = azurerm_resource_group.rg.name

  backend_pool {
    name = "backend-pool"

    backend {
      host_header = azurerm_linux_web_app.app_service.default_hostname
      address     = azurerm_linux_web_app.app_service.default_hostname
      http_port   = 80
      https_port  = 443
    }

    health_probe_name     = "example-health-probe"
    load_balancing_name   = "example-load-balancing"
  }

  backend_pool_health_probe {
    name = "example-health-probe"

    protocol = "Https"
    path     = "/"
    interval_in_seconds = 30
  }

  backend_pool_load_balancing {
    name = "example-load-balancing"

    additional_latency_milliseconds = 0
    sample_size                     = 4
    successful_samples_required     = 2
  }

  frontend_endpoint {
    name      = "frontend-endpoint"
    host_name = "example-frontdoor.azurefd.net"
  }

  routing_rule {
    name               = "example-routing-rule"
    accepted_protocols = ["Http", "Https"]
    frontend_endpoints = ["frontend-endpoint"]
    patterns_to_match  = ["/*"]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "backend-pool"
    }
  }
}
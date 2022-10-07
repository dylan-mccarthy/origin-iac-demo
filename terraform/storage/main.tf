resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name
    location = var.location
    tags = {
        environment = var.environment
    }
}


resource "azurerm_storage_account" "sa" {
    name                     = var.storage_account_name
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    account_kind             = "StorageV2"
    enable_https_traffic_only = true
    min_tls_version = "TLS1_2"
    allow_blob_public_access = false
    network_rules {
        default_action = "Deny"
        bypass         = ["AzureServices"]
    }
    tags = {
        environment = var.environment
    }
}


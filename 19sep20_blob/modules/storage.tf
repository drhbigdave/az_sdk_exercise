resource "azurerm_storage_account" "sa1" {
  name                     = var.sa1_name
  location                 = azurerm_resource_group.rg1.location
  resource_group_name      = azurerm_resource_group.rg1.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment_tag
  }
}
resource "azurerm_storage_account_network_rules" "test" {
  resource_group_name  = azurerm_resource_group.rg1.name
  storage_account_name = azurerm_storage_account.sa1.name

  default_action = "Deny"
  ip_rules       = [data.azurerm_key_vault_secret.davids_home_ip.value, data.azurerm_key_vault_secret.shanikas_home_ip.value]
  #virtual_network_subnet_ids = [azurerm_subnet.container_subnet.id, azurerm_subnet.vnet1_subnet1.id]
  bypass = ["AzureServices"]
}

resource "azurerm_storage_container" "containers" {
  storage_account_name  = azurerm_storage_account.sa1.name
  for_each              = var.container_values
  name                  = each.value["name"]
  container_access_type = each.value["access_type"]
}
/*
resource "azurerm_storage_container" "container2" {
  name                  = var.container2_name
  storage_account_name  = azurerm_storage_account.sensor_sa.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "container3" {
  name                  = var.container3_name
  storage_account_name  = azurerm_storage_account.sensor_sa.name
  container_access_type = "private"
}
resource "azurerm_storage_container" "container4" {
  name                  = var.container4_name
  storage_account_name  = azurerm_storage_account.sensor_sa.name
  container_access_type = "private"
}
*/

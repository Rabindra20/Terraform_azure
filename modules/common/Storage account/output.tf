output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}
output "account_tier" {
  value = azurerm_storage_account.storage_account.account_tier
}
output "account_replication_type" {
  value = azurerm_storage_account.storage_account.account_replication_type
}
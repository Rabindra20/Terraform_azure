variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "sku_name" {
  type = string
}
variable "keyvault_name" {
  type = string
}
variable "key_permissions" {
  type = list(string)
  default = [
    "Get",
    "List"
  ]
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "os_type" {
  type = string
}
variable "sku_name" {
  type = string
}
variable "appserviceplanname" {
  type = string
}
variable "webapp_name" {
  type = string
}
variable "repo_url" {
  type = string
}
variable "branch" {
  type = string
}
variable "use_manual_integration" {
  type = bool 
}
variable "use_mercurial" {
  type = bool
}
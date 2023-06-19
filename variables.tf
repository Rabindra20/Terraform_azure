variable "Environment" {
  type = string
  default= "prod"
}
variable "Team" {
  type = string
  default= "devops"
}

# variable "vmname" {
#   type = string
#   default = "test-rdp"
# }

# variable "vmusername" {
#   type = string
# }

# variable "vmpassowrd" {
#   type = string
# }
variable "ARM_CLIENT_SECRET" {
  type = string
}
variable "ARM_CLIENT_ID" {
  type = string
}
variable "enabled" {
  type = bool
  default = true
}
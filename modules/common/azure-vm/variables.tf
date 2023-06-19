variable "prefix" {
  type = string
  default = "saroj"
}
variable "environment" {
  type = string
  default = "test"
}
variable "vm_size" {
  type = string
  default = "Standard_B2s"
}

variable "vmname" {
  type = string
  default = "test-rdp"
}

variable "vmusername" {
  type = string
}

variable "vmpassword" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}
variable "resource_group_name" {}

variable "resource_group_location" {}

variable "db_user_name" {
  default = "posqladmin"
}

variable "db_password" {
  default = "Automation@123"
}

variable "db_version" {
  default = "9.5"
}

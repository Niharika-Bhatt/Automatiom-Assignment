
variable "resource_group_name" {}

variable "resource_group_location" {}

variable "vmlinux_avs" { 
  default = "linux_availability_set" 
}

variable "nb_count" {}

variable "vmlinux_name" {}

variable "vmlinux_size" {
  default = "Standard_B1s"
}

variable "private_key" {
  default = "C:\\Users\\19057\\.ssh\\id_rsa"
}

variable "admin_username" {
  default = "n01536074"
}

variable "public_key" {
  default = "C:\\Users\\19057\\.ssh\\id_rsa.pub"
}

variable "os_disk_attributes" {
  type = map(string)
  default = {
    os-storage-account-type = "Premium_LRS"
    os-disk-size            = "32"
    os-disk-caching         = "ReadWrite"
  }
}

variable "source_images_details" {
  type = map(string)
  default = {
    os-publisher = "OpenLogic"
    os-offer     = "CentOS"
    os-sku       = "8_2"
    os-version   = "latest"
  }
}


variable "st_acc_name" {}

variable "st_acc_key" {}

variable "st_acc_u" {}

variable "subnet_id" {}




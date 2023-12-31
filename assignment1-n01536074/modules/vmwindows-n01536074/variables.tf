variable "vmwindows_name" {}

variable "subnet_id" {}

variable "resource_group_name" {}

variable "resource_group_location" {}

variable "windows_nb_count" {}

variable "windows_availability_set" { 
  default = "win_avs" 
}

variable "vmwindows_os_disk_attributes" {
  type = map(string)
  default = {
    os-storage-account-type = "StandardSSD_LRS"
    os-disk-size            = "128"
    os-disk-Caching         = "ReadWrite"
  }
}

variable "vmwindows_source_images_details" {
  type = map(string)
  default = {
    os-publisher = "MicrosoftWindowsServer"
    os-offer     = "WindowsServer"
    os-sku       = "2016-Datacenter"
    os-version   = "latest"
  }
}

variable "admin_username" {
  default = "n01536074"
}

variable "admin_password" {
  default = "Automation@123"
}

variable "st_acc" {}

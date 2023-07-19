output "windows_availability_set" {
  value = azurerm_availability_set.win_availability_set
}

output "win_vm" {
  value =  values(azurerm_windows_virtual_machine.vm_windows)[*].id
}

output "vmwindows_hostname" {
  value = [values(azurerm_windows_virtual_machine.vm_windows)[*].name]
}

output "win_public_ip" {
  value = [values(azurerm_windows_virtual_machine.vm_windows)[*].public_ip_address]
}

output "win_private_ip" {
  value = [values(azurerm_windows_virtual_machine.vm_windows)[*].private_ip_address]
}

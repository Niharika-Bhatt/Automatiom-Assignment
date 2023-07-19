output "rgroup_net_name" {
  value = module.resource_group.rg_name.name
}

output "rgroup_net_location" {
  value = module.resource_group.rg_location.location
}

output "vnet_subnet_name" {
  value = module.network.vnet_subnet_name.name
}

output "vnet_name" {
  value = module.network.vnet_name.name
}

output "vnet_space" {
  value = module.network.vnet_name.address_space
}

output "vnet_sg_name1" {
  value = module.network.vnet_sg_name.name
}


output "log_aw_name" {
  value = module.common.log_aw_name.name
}

output "recovery_services_vault_name" {
  value = module.common.recovery_services_vault_name.name
}

output "st_acc_name" {
  value = module.common.st_acc_name.name
}

output "vmlinux_private_ip" {
  value = module.vmlinux.vmlinux_private_ip
}

output "linux_public_ip" {
  value = module.vmlinux.linux_public_ip
}

output "vm_linux" {
  value = module.vmlinux.vm_linux
}

output "linux_hostname" {
  value = module.vmlinux.linux_hostname
}

output "vmwindows_hostname" {
  value = module.vmwindows.vmwindows_hostname
}

output "win_public_ip" {
  value = module.vmwindows.win_public_ip
}

output "win_private_ip" {
  value = module.vmwindows.win_private_ip
}


output "data_base_name" {
  value = module.database.data_base_name.name
}
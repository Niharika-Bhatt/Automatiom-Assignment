module "resource_group" {
  source          = "./modules/rg-n01536074"
  resource_group_name     = "n01536074-RG"
  resource_group_location = "canada Central"
}

module "network" {
  source          = "./modules/network-n01536074"
  resource_group_name     = module.resource_group.rg_name.name
  resource_group_location  = module.resource_group.rg_location.location
  depends_on      = [
    module.resource_group
  ]
}


module "common" {
  source          = "./modules/common-n01536074"
  resource_group_name     = module.resource_group.rg_name.name
  resource_group_location = module.resource_group.rg_location.location
  subnet_id       = module.network.vnet_subnet_name
  depends_on      = [
    module.resource_group
  ]
}

module "vmlinux" {
  source            = "./modules/vmlinux-n01536074"
  nb_count          = "3"
  vmlinux_name     = "vmlinux-n01536074"
  resource_group_name       = module.resource_group.rg_name.name
  resource_group_location   = module.resource_group.rg_location.location
  subnet_id         = module.network.vnet_subnet_name.id
  depends_on        = [
    module.resource_group,
    module.network,
    module.common
  ]
  st_acc_name = module.common.st_acc_name.name
  st_acc_key  = module.common.st_acc_key
  st_acc_u    = module.common.st_acc_name
}


module "vmwindows" {
  source         = "./modules/vmwindows-n01536074"
  vmwindows_name   = {
    n01536074-vm1 = "Standard_B1s"
    n01536074-vm2 = "Standard_B1ms"
  }
  windows_nb_count     = "1"
  subnet_id        = module.network.vnet_subnet_name.id
  resource_group_name      = module.resource_group.rg_name.name
  resource_group_location  = module.resource_group.rg_location.location
  st_acc           = module.common.st_acc_name
  depends_on       = [
    module.resource_group,
    module.network,
    module.common
  ]
}

module "data_disk" {
  source                   = "./modules/datadisk-n01536074"
  resource_group_name              = module.resource_group.rg_name.name
  resource_group_location          = module.resource_group.rg_location.location
  vmwindows_name             = module.vmwindows.vmwindows_hostname
  windows_vm_id              = module.vmwindows.win_vm
  vmlinux_name            = module.vmlinux.linux_hostname
  linux_vm_id              = module.vmlinux.linux_id
  depends_on               = [
    module.resource_group,
    module.vmlinux,
    module.vmwindows
  ]
}
module "load_balancer" {
  source           = "./modules/loadbalancer-n01536074"
  resource_group_name      = module.resource_group.rg_name.name
  resource_group_location  = module.resource_group.rg_location.location
  vmlinux_public_ip  = module.vmlinux.linux_public_ip
  vmlinux_nic_id     = module.vmlinux.linux_nic_id[0]
  nb_count         = "1"
  vmlinux_name    = module.vmlinux.linux_hostname
  subnet_id        = module.network.vnet_subnet_name
  depends_on       = [
    module.resource_group,
    module.vmlinux,
  ]
}


module "database" {
  source      = "./modules/database-n01536074"
  resource_group_name     = module.resource_group.rg_name.name
  resource_group_location = module.resource_group.rg_location.location
  depends_on = [
    module.resource_group
  ]
}
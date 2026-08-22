module "resource_group" {
  source         = "../child_module/resource_group"
  resource_group = var.resource_group

}
module "virtual_network" {
  source          = "../child_module/virtual_network"
  virtual_network = var.virtual_network
  depends_on      = [module.resource_group]

}
module "subnet" {
  source     = "../child_module/subnet"
  subnets    = var.subnets
  depends_on = [module.virtual_network]
}
module "nsg" {
  source                 = "../child_module/nsg"
  network_security_group = var.network_security_group
  depends_on             = [module.subnet]

}
module "public_ips" {
  source     = "../child_module/public_ips"
  public_ips = var.public_ips
  depends_on = [module.subnet]
  }
    module "nic" {
    source = "../child_module/nic"
    nics = var.nics
    depends_on = [ module.subnet , module.nsg ]
  }
  module "bastions" {
  source     = "../child_module/bastion"
  bastions   = var.bastions
  depends_on = [module.public_ips, module.subnet]

}
module "linux_vms" {
  source     = "../child_module/linux"
  linux_vms  = var.linux_vms
  depends_on = [module.nic , module.bastions]

}

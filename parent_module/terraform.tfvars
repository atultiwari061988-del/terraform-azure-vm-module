resource_group = {

  rg1 = {
    name     = "production_rg"
    location = "south india"
  }
}
virtual_network = {
  vnet1 = {
    name                = "production-vnet"
    resource_group_name = "production_rg"
    location            = "south india"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["8.8.8.8", "8.8.4.4"]
  }
}

subnets = {
  bastion = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "production_rg"
    virtual_network_name = "production-vnet"
    address_prefixes     = ["10.0.1.0/26"]
  }
  vm = {
    name                 = "VMSubnet"
    resource_group_name  = "production_rg"
    virtual_network_name = "production-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
network_security_group = {
  nsg1 = {
    name                 = "vm-nsg"
    location             = "south india"
    resource_group_name  = "production_rg"
    virtual_network_name = "production-vnet"
    subnet_name          = "VMSubnet"
  }
}
#yahan bastion ke liye publick ip define krenge
public_ips = {
  bastion = {
    name                = "bastion-pip"
    location            = "south india"
    resource_group_name = "production_rg"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
nics = {
  vm1 = {
    name                 = "nic-vm1"
    location             = "south india"
    resource_group_name  = "production_rg"
    subnet_name          = "VMSubnet"
    virtual_network_name = "production-vnet"
    private_ip_allocation = "Dynamic"
  }
  vm2 = {
    name                 = "nic-vm2"
    location             = "south india"
    resource_group_name  = "production_rg"
    subnet_name          = "VMSubnet"
    virtual_network_name = "production-vnet"
    private_ip_allocation = "Dynamic"
  }
}
bastions = {
  bastion1 = {
    name                 = "production-bastion"
    location             = "south india"
    resource_group_name  = "production_rg"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "production-vnet"
    public_ip_name       = "bastion-pip"
  }
}
linux_vms = {
  vm1 = {
    name                = "linux-vm-01"
    location            = "south india"
    resource_group_name = "production_rg"
    size                = "Standard_D2a_v4"
    admin_username     = "ak35598"
    admin_password     = "Vyomika@35598"
    nic_name            = "nic-vm1"
  }
  vm2 = {
    name                = "linux-vm-02"
    location            = "south india"
    resource_group_name = "production_rg"
    size                = "Standard_D2a_v4"
    admin_username     = "ak35599"
    admin_password     = "Vyomika@35599"
    nic_name            = "nic-vm2"

  }
  
  }





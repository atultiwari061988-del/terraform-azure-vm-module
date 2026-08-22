data "azurerm_subnet" "subnet" {
    for_each =  var.network_security_group
    name = each.value.subnet_name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name =  each.value.resource_group_name
  }
resource "azurerm_network_security_group" "nsg" {
    for_each = var.network_security_group
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name

#ssh rule
security_rule {

    name = "Allow-SSH"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"

}
#HTTP rule
  security_rule {

    name = "Allow-HTTP"

    priority = 200

    direction = "Inbound"

    access = "Allow"

    protocol = "Tcp"

    source_port_range = "*"

    destination_port_range = "80"

    source_address_prefix = "*"

    destination_address_prefix = "*"

  }
  #HTTPS rule
     security_rule {

    name = "Allow-HTTPS"

    priority = 300

    direction = "Inbound"

    access = "Allow"

    protocol = "Tcp"

    source_port_range = "*"

    destination_port_range = "443"

    source_address_prefix = "*"

    destination_address_prefix = "*"

  }
}
resource "azurerm_subnet_network_security_group_association" "association" {

  for_each = var.network_security_group

  subnet_id = data.azurerm_subnet.subnet[each.key].id

  network_security_group_id = azurerm_network_security_group.nsg[each.key].id

}


provider "azurerm" { }

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"
}

# Virtual Networks

# shared - vnet0
resource "azurerm_virtual_network" "vnet0" {
  name                = "${var.vnet0}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space       = ["${var.vnet0_address_space}"]
  tags                = "${merge(local.common_tags, var.vnet0_tags)}"
}

# prod - vnet1
resource "azurerm_virtual_network" "vnet1" {
  name                = "${var.vnet1}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space       = ["${var.vnet1_address_space}"]
  tags                = "${merge(local.common_tags, var.vnet1_tags)}"
}

# non-prod - vnet2
resource "azurerm_virtual_network" "vnet2" {
  name                = "${var.vnet2}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space       = ["${var.vnet2_address_space}"]
  tags                = "${merge(local.common_tags, var.vnet2_tags)}"
}


# Subnets

# shared - subnet0
resource "azurerm_subnet" "subnet0" {
  name                 = "${var.vnet0_subnet_names[count.index]}"
  virtual_network_name = "${azurerm_virtual_network.vnet0.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.vnet0_subnet_prefixes[count.index]}"
  count                = "${length(var.vnet0_subnet_names)}"
}

# prod - subnet1
resource "azurerm_subnet" "subnet1" {
  name                 = "${var.vnet1_subnet_names[count.index]}"
  virtual_network_name = "${azurerm_virtual_network.vnet1.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.vnet1_subnet_prefixes[count.index]}"
  count                = "${length(var.vnet1_subnet_names)}"
}

# non-prod - subnet2
resource "azurerm_subnet" "subnet2" {
  name                 = "${var.vnet2_subnet_names[count.index]}"
  virtual_network_name = "${azurerm_virtual_network.vnet2.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.vnet2_subnet_prefixes[count.index]}"
  count                = "${length(var.vnet2_subnet_names)}"
}

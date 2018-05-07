# file - variables.tf

variable "resource_group" {
  description = "The resource group for the virtual network"
  type = "string"
}

variable "location" {
  description = "The location/region assigned to the resource group."
  type = "string"
}

variable "vnet_location" {
  description = "location of vnet being created. This shell script provides this variable. Enables vnets of different regions to go in the same resource group"
  type = "string"
}

# Common Vnet Tags - ADD COMMON TAGS HERE.
locals {
  common_tags = {
    resource_group = "${var.resource_group}"
    location = "${var.vnet_location}"
  }
}


#===========================
# VNETS
#===========================

## SHARED - vnet0 ##
variable "vnet0" {
  description = "The name for vnet0"
  type = "string"
}
variable "vnet0_address_space" {
  description = "Cidr address space for vnet0"
  type = "string"
}
variable "vnet0_tags" {
  description = "Tags for vnet0"
  type        = "map"
}

## PROD - vnet1 ##
variable "vnet1" {
  description = "The name for vnet1"
  type = "string"
}
variable "vnet1_address_space" {
  description = "Cidr address space for vnet1"
  type = "string"
}
variable "vnet1_tags" {
  description = "Tags for vnet 1"
  type        = "map"
}

## NONPROD - vnet2 ##
variable "vnet2" {
  description = "The name for vnet2"
  type = "string"
}
variable "vnet2_address_space" {
  description = "Cidr address space for vnet2"
  type = "string"
}
variable "vnet2_tags" {
  description = "Tags for vnet 2"
  type        = "map"
}

## Default - vnet3 ##
variable "vnet3" {
  description = "The name for vnet3"
  type = "string"
}
variable "vnet3_address_space" {
  description = "Cidr address space for vnet3"
  type = "string"
}
variable "vnet3_tags" {
  description = "Tags for vnet 3"
  type        = "map"
}

#===========================
# SUBNETS
#===========================

#### SHARED - vnet0 subnets #####
variable "vnet0_subnet_names" {
  description = "The list of subnets for vnet0"
  type = "list"
}
variable "vnet0_subnet_prefixes" {
  description = "The Address prefixes to use for vnet0 subnets"
  type = "list"
}

#### PROD - vnet1 subnets #####
variable "vnet1_subnet_names" {
  description = "The list of subnets for vnet1"
  type = "list"
}
variable "vnet1_subnet_prefixes" {
  description = "The Address prefixes to use for vnet1 subnets"
  type = "list"
}

#### NONPROD - vnet2 subnets #####
variable "vnet2_subnet_names" {
  description = "The list of subnets for vnet2"
  type = "list"
}
variable "vnet2_subnet_prefixes" {
  description = "The Address prefixes to use for vnet2 subnets"
  type = "list"
}

#### DEFAULT / WORKSPACES - vnet3 subnets #####
variable "vnet3_subnet_names" {
  description = "The list of subnets for vnet3"
  type = "list"
}
variable "vnet3_subnet_prefixes" {
  description = "The Address prefixes to use for vnet3 subnets"
  type = "list"
}

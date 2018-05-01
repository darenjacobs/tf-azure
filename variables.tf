variable "resource_group" {
  description = "The name of the resoure group in which to create the virtual network"
  default = "primary"
}

variable "location" {
  description = "The location/region in which to create the virtual network.  Changing this forces new resource to be created"
  default = "eastus"
}

# Common Vnet Tags - ADD COMMON TAGS HERE.
locals {
  common_tags = {
    resource_group = "${var.resource_group}"
    location = "${var.location}"
  }
}


#===========================
# VNETS
#===========================

## SHARED - vnet0 ##
variable "vnet0" {
  description = "The name for vnet0"
  default = "shared"
}
variable "vnet0_address_space" {
  description = "Cidr address space for vnet0"
  default = "172.60.0.0/16"
}
variable "vnet0_tags" {
  description = "Tags for vnet0"
  type        = "map"
  default = {
    name = "vnet0"
    environment = "shared"
  }
}

## PROD - vnet1 ##
variable "vnet1" {
  description = "The name for vnet1"
  default = "prod"
}
variable "vnet1_address_space" {
  description = "Cidr address space for vnet1"
  default = "172.61.0.0/16"
}
variable "vnet1_tags" {
  description = "Tags for vnet 1"
  type        = "map"
  default = {
    name = "vnet1"
    environment = "prod"
  }
}

## NON-PROD - vnet2 ##
variable "vnet2" {
  description = "The name for vnet2"
  default = "non-prod"
}
variable "vnet2_address_space" {
  description = "Cidr address space for vnet2"
  default = "172.62.0.0/16"
}
variable "vnet2_tags" {
  description = "Tags for vnet 2"
  type        = "map"

  default = {
    name = "vnet2"
    environment = "non-prod"
  }
}


#===========================
# SUBNETS
#===========================

#### SHARED - vnet0 subnets #####
variable "vnet0_subnet_names" {
  description = "The list of subnets for vnet0"
  default = ["shared-sec", "shared-code"]
}
variable "vnet0_subnet_prefixes" {
  description = "The Address prefixes to use for vnet0 subnets"
  default = ["172.60.64.0/22", "172.60.12.0/22"]
}

#### PROD - vnet1 subnets #####
variable "vnet1_subnet_names" {
  description = "The list of subnets for vnet1"
  default = ["prod-lnx-backoffice", "prod-lnx-dba"]
}
variable "vnet1_subnet_prefixes" {
  description = "The Address prefixes to use for vnet1 subnets"
  default = ["172.61.94.0/24", "172.61.84.0/22"]
}

#### NON-PROD - vnet2 subnets #####
variable "vnet2_subnet_names" {
  description = "The list of subnets for vnet2"
  default = ["non-prod-win-backoffice", "non-prod-win-app"]
}
variable "vnet2_subnet_prefixes" {
  description = "The Address prefixes to use for vnet2 subnets"
  default = ["172.62.142.0/24", "172.62.64.0/22"]
}

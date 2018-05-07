# Variable definitions used in main.tf

resource_group = "Primary"
location = "eastus"
vnet_location = "eastus2"

#===========================
# VNETS
#===========================

## SHARED - vnet0 ##
vnet0 = "e2-shared"
vnet0_address_space = "172.60.0.0/16"
vnet0_tags = { vnet_name = "vnet0", Name = "e2-shared" }

## PROD - vnet1 ##
vnet1 = "e2-prod"
vnet1_address_space = "172.61.0.0/16"
vnet1_tags = { vnet_name = "vnet1", Name = "e2-prod" }

## NONPROD - vnet2 ##
vnet2 = "e2-nonprod"
vnet2_address_space = "172.62.0.0/16"
vnet2_tags = { vnet_name = "vnet2", Name = "e2-nonprod" }

## DEFAULT - vnet3 ##
vnet3 = "e2-default"
vnet3_address_space = "172.71.0.0/16"
vnet3_tags = { vnet_name = "vnet3", Name = "e2-default" }

#===========================
# SUBNETS - the names need to line up with the prefixes
#===========================

#### SHARED - vnet0 subnets #####
vnet0_subnet_names = ["e2-a-shared-dmz", "e2-a-shared-core", "e2-a-shared-sec", "e2-a-shared-code"]
vnet0_subnet_prefixes = ["172.60.62.0/24", "172.60.4.0/22", "172.60.0.0/22", "172.60.12.0/22"]

#### PROD - vnet1 subnets #####
vnet1_subnet_names = ["e2-a-prod-lnx-backoffice", "e2-a-prod-win-dba", "e2-a-prod-win-backoffice", "e2-a-prod-lnx-dba"]
vnet1_subnet_prefixes = ["172.61.30.0/24", "172.61.4.0/22", "172.61.14.0/24", "172.61.20.0/22"]

#### NONPROD - vnet2 subnets #####
vnet2_subnet_names = ["e2-b-nonprod-lnx-dba", "e2-a-nonprod-win-backoffice", "e2-a-nonprod-win-app", "e2-a-nonprod-win-jenkins"]
vnet2_subnet_prefixes = ["172.62.84.0/22", "172.62.14.0/24", "172.62.0.0/22", "172.62.15.0/24"]

#### DEFAULT - vnet3 subnets #####
vnet3_subnet_names = ["subnet0", "subnet1", "subnet2"]
vnet3_subnet_prefixes = ["172.71.0.0/20", "172.71.16.0/20", "172.71.32.0/20"]

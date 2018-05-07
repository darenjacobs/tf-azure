# Variable definitions used in main.tf

resource_group = "primary"
location = "eastus"
vnet_location = "eastus"

#===========================
# VNETS
#===========================

## SHARED - vnet0 ##
vnet0 = "e1-shared"
vnet0_address_space = "172.56.0.0/16"
vnet0_tags = { vnet_name = "vnet0", Name = "e1-shared" }

## PROD - vnet1 ##
vnet1 = "e1-prod"
vnet1_address_space = "172.57.0.0/16"
vnet1_tags = { vnet_name = "vnet1", Name = "e1-prod" }

## NONPROD - vnet2 ##
vnet2 = "e1-nonprod"
vnet2_address_space = "172.58.0.0/16"
vnet2_tags = { vnet_name = "vnet2", Name = "e1-nonprod" }

## Workspaces - vnet3 ##
vnet3 = "e1-workspaces"
vnet3_address_space = "172.59.240.0/20"
vnet3_tags = { vnet_name = "vnet3", Name = "e1-workspaces" }

#===========================
# SUBNETS - the names need to line up with the prefixes
#===========================

#### SHARED - vnet0 subnets #####
vnet0_subnet_names = ["e1-1a-shared-dmz", "e1-1b-shared-devops", "e1-1a-shared-code", "e1-1a-shared-sec", "e1-1a-shared-public"]
vnet0_subnet_prefixes = ["172.56.62.0/24", "172.56.80.0/22", "172.56.12.0/22", "172.56.0.0/22", "172.56.63.0/24"]

#### PROD - vnet1 subnets #####
vnet1_subnet_names = ["e1-1c-prod-lnx-jenkins", "e1-1c-prod-lnx-app", "e1-1b-prod-lnx-dba", "e1-1a-prod-win-app"]
vnet1_subnet_prefixes = ["172.57.159.0/24", "172.57.144.0/22", "172.57.84.0/22", "172.57.0.0/22"]

#### NONPROD - vnet2 subnets #####
vnet2_subnet_names = ["e1-1a-nonprod-lnx-jenkins", "e1-1a-nonprod-TEMP-MWS", "e1-1a-nonprod-win-jenkins", "e1-1c-prod-lnx-app"]
vnet2_subnet_prefixes = ["172.58.31.0/24", "172.58.59.0/24", "172.58.15.0/24", "172.58.144.0/22"]

#### WORKSPACES - vnet3 subnets #####
vnet3_subnet_names = ["e1-1a-workspaces-consultants", "e1-1b-workspaces-consultants"]
vnet3_subnet_prefixes = ["172.59.252.0/23", "172.59.254.0/23"]

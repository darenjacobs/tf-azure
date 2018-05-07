# Terraform with Azure provider

## Deploy
```
prompt> az login
prompt> t_plan.sh
prompt> t_go.sh
```

## Infrastructure model:
```
eastus is modelled after AWS us-east-1(N. Virginia)
eastus2 is modeled after AWS us-east-2(Ohio)
```

## Note
This configuration is modular like Andrew's [Infrastructure as Code](http://bitbucket:7990/projects/DEVOPSDEV/repos/tf-infra-as-code/browse/aws-primary)

```
Cidr blocks:
Primary
* AWS us-east-1: 172.16.0.0/16, 172.17.0.0/16, 172.18.0.0/16, 172.19.240.0/20
* AZR    eastus: 172.56.0.0/16, 172.57.0.0/16, 172.58.0.0/16, 172.59.240.0/20
* AWS us-east-2: 172.20.0.0/16, 172.21.0.0/16, 172.22.0.0/16, 172.31.0.0/16
* AZR   eastus2: 172.60.0.0/16, 172.61.0.0/16, 172.62.0.0/16, 172.71.0.0/16
```
## <TERRAFORM_RANT>
```
Terraform should allow loops instead of having to write out the same block 4 times.
Should be like this:
for i in 0 1 2 3 do
  # shared - vnet${i}
  resource "azurerm_virtual_network" "vnet${i}" {
    name                = "${var.vnet${i}}"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    address_space       = ["${var.vnet${i}_address_space}"]
    tags                = "${merge(local.common_tags, var.vnet${i}_tags)}"
  }
done
```

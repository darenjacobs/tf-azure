#/bin/sh

# DEBUG - TF_LOG=DEBUG terraform import azurerm_resource_group.primary /subscriptions/8fc81d30-44f2-4be2-b49a-1f3537b4d50a/resourceGroups/primary

for location in eastus eastus2; do
  TF_LOG=DEBUG terraform plan -var-file=${location}/${location}.tfvars -state=${location}/${location}.tfstate
done

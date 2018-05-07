#/bin/sh


for location in eastus eastus2; do
  terraform apply -var-file=${location}/${location}.tfvars -state=${location}/${location}.tfstate
done

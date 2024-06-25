# Create a resource group
az group create --name "rg_tfstate" --location "westeurope"

# Create a storage account
az storage account create --name "storstate" --resource-group "rg_tfstate" --location "westeurope"

# Create a storage container
az storage container create --account-name "storstate" --name "tfbackends"
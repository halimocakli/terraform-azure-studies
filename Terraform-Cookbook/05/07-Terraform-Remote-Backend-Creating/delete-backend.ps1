# Delete the storage container
az storage container delete --account-name "storstate" --name "tfbackends"

# Delete the storage account
az storage account delete --name "storstate" --resource-group "rg_tfstate"

# Delete the resource group
az group delete --name "rg_tfstate"
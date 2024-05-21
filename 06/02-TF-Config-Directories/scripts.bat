terraform -chdir=network init
terraform -chdir=network plan -out=network.tfplan
terraform -chdir=network apply network.tfplan
terraform -chdir=database init
terraform -chdir=database plan -out=database.tfplan
terraform -chdir=database apply database.tfplan
terraform -chdir=web init
terraform -chdir=web plan -out=web.tfplan
terraform -chdir=web apply web.tfplan

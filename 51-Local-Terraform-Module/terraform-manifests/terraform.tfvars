location                           = "eastus"
resource_group_name                = "myrg-static-web-site"
storage_account_name               = "halimstatic"
storage_account_tier               = "Standard"
storage_account_replication_type   = "LRS"
storage_account_kind               = "StorageV2"
static_website_index_document      = "index.html"
static_website_error_404_document  = "error.html"
storage_blob_index_document_name   = "index.html"
storage_blob_error_document_name   = "error.html"
storage_blob_container_name        = "$web"
storage_blob_type                  = "Block"
storage_blob_content_type          = "text/html"
storage_blob_index_document_source = "C:\\Users\\hocakli\\Github-Halim\\terraform-azure-studies\\Terraform-Azure-Course\\51-Local-Terraform-Module\\static-content\\index.html"
storage_blob_error_document_source = "C:\\Users\\hocakli\\Github-Halim\\terraform-azure-studies\\Terraform-Azure-Course\\51-Local-Terraform-Module\\static-content\\error.html"


# Bu aşamada lokal modülü çağıracağız
module "azure_static_website" {
  source  = "halimocakli/static-website/azurerm"
  version = "2.0.0"

  location                          = var.location
  resource_group_name               = var.resource_group_name
  storage_account_name              = var.storage_account_name
  storage_account_tier              = var.storage_account_tier
  storage_account_kind              = var.storage_account_kind
  storage_account_replication_type  = var.storage_account_replication_type
  static_website_index_document     = var.static_website_index_document
  static_website_error_404_document = var.static_website_error_404_document

  storage_blob_index_document_name   = var.storage_blob_index_document_name
  storage_blob_error_document_name   = var.storage_blob_error_document_name
  storage_blob_container_name_index  = var.storage_blob_container_name_index
  storage_blob_type_index            = var.storage_blob_type_index
  storage_blob_content_type_index    = var.storage_blob_content_type_index
  storage_blob_container_name_error  = var.storage_blob_container_name_error
  storage_blob_type_error            = var.storage_blob_type_error
  storage_blob_content_type_error    = var.storage_blob_content_type_error
  storage_blob_index_document_source = var.storage_blob_index_document_source
  storage_blob_error_document_source = var.storage_blob_error_document_source
}



terraform {
  backend "azurerm" {
    storage_account_name = "hemanthstorageaccount"
    container_name = "hemanthbackend"
    key = "terraform.tfstate"
    access_key = ""
  }
}

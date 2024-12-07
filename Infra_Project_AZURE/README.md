# Azure Infrastructure Setup with Terraform

This project automates the creation of Azure resources using Terraform. It includes the following resources:
- Resource Group
- Virtual Network (VNet)
- Virtual Machine (VM)
- Virtual Interface
- Subnet

### Features
- **Backend:** Stores the Terraform state file in an Azure Storage Account.
- **Variables:** The configurations are parameterized with variables for flexibility.
- **Provider:** Uses the AzureRM provider for seamless integration with Azure.

### Setup
1. Ensure you are logged into Azure CLI (`az login`).
2. Run `terraform init` to initialize the working directory.
3. Apply the configuration with `terraform apply`.



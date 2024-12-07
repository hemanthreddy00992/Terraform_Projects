# Azure Infrastructure Setup with Terraform
<img width="859" alt="Screenshot 2024-12-07 at 1 45 26 PM" src="https://github.com/user-attachments/assets/961e8515-a659-4b5e-b4ce-028a6ab80b14">


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

### Terraform Commands
- `terraform init`: Initializes the working directory, downloads required providers.
- `terraform validate`: Validates the configuration for syntax errors.
- `terraform plan`: Creates an execution plan for the resources.
- `terraform apply`: Applies the configuration to create resources.

### Setup
1. Log in to Azure CLI: `az login`.
2. Run `terraform init` to initialize.
3. Validate the configuration with `terraform validate`.
4. Run `terraform plan` to preview the changes.
5. Apply the changes with `terraform apply`.

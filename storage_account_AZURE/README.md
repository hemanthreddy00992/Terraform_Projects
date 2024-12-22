# Storage account created in Az

This project automates the creation of Azure resources using Terraform. It includes the following resources:
- Resource Group
- Storage account

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


# Azure Service Principal Demo

This provides a step-by-step guide to log in to Azure, create a Service Principal, and set up environment variables for authentication.

## Steps to Run the Demo

### 1. Log in to Azure
To authenticate with your Azure account, use the following command:
```bash
az login
```
This will open a browser window for authentication or provide a device login code if running on a headless system.

---

### 2. Create a Service Principal
Run the following command to create a Service Principal with the `Contributor` role:
```bash
az ad sp create-for-rbac -n az-demo --role="Contributor" --scopes="/subscriptions/$SUBSCRIPTION_ID"
```
Replace `$SUBSCRIPTION_ID` with your Azure Subscription ID. You can find the Subscription ID by running:
```bash
az account show --query id --output tsv
```

**Note:** Save the values generated in the output of this command as they will be needed in the next step.

---

### 3. Set Environment Variables
Export the following environment variables to use the Service Principal for authentication:
```bash
export ARM_CLIENT_ID="<client_id_from_output>"
export ARM_CLIENT_SECRET="<client_secret_from_output>"
export ARM_SUBSCRIPTION_ID="<your_subscription_id>"
export ARM_TENANT_ID="<tenant_id_from_output>"
```
Replace the placeholders (`<client_id_from_output>`, etc.) with the values from the previous step's output.

---

### 4. Verify Authentication
Run the following command to verify that the Service Principal is set up correctly:
```bash
az account show
```
If the authentication is successful, the command will return details of the subscription.

---

## Notes
- Ensure that the subscription you are using is active and not disabled.
- If you encounter any issues with permissions, ensure your account has sufficient privileges to assign roles.
---

## Troubleshooting
If you encounter the error `ReadOnlyDisabledSubscription`:
1. Check the subscription state using:
   ```bash
   az account show --subscription "$SUBSCRIPTION_ID"
   ```
   Ensure the state is `Enabled`.
2. Resolve any billing or subscription issues in the Azure Portal.


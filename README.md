# Terraform for Azure Data Engineering

Sets up Azure DataFactory with 2 containers. It Copies contents from one container to the dest container. It also creates Storage Group, Azure Synapse Analytics with Dedicated SQL pool. Access to Azure synapse Analytics is given to the primary subscription from all IP. 
## Installing

install Brew


After installing brew run the following commands <br>

1. brew tap hashicorp/tap <br>
2. brew install hashicorp/tap/terraform<br>
3. brew update && brew install azure-cli<br>               
4. az login<br>
5. az account set --subscription "<SUBSCRIPTION ID>"
6. az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION ID>"

**Note:**
- user to whom assingment is to be done should be added in Azure AD before running the apply
- Keep note of the client secret 

## Running terraform

1. terraform init<br>
2. terraform apply -var="client_secret=CLIENT_SECRET" -var="client_id=CLIENT_ID" -var="tenant_id=TENTANT_ID"         -var="primary_subscription=SUBSCRIPTION_ID" -auto-approve


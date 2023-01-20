# Terraform for Azure Data Engineering

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
2. terraform apply -var="client_secret=<CLIENT SECRET>"  -auto-approve


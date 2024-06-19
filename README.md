# tf-aws-iac-3tier
## Terraform AWS IAC for [motoshop](https://github.com/nklkarthi/motoShop) Application

*Terraform configuration files for provisioning infrastructure*

    Networking (vpc,subnet and igw)
    VMs (EC2 Instances)
    Load Balancing (ALB)
    Database (RDS - Postgres)
    Key Vault (KMS - Storing the DB password)


*Terraform configuration files for provisioning application build and deploy*

    Storing the Artifacts (S3)
    Container Registry (ECR)
    Roles for CICD (IAM)
    Application build (Code Build)
    Application Deploy (Code Deploy)
    Pipeline orchestration (Code Pipeline)

*Terraform configuration files are structured as modules for each related resource and the root module*
    
    main.tf
    variables.tf
    outputs.tf


*Terraform Cloud as backend to store the data using the following resources*

    terraform.tf
    provider.tf


*To use this repository, you will need*

    AWS Account
    Terraform Client (1.8.5)
    AWS CLI (Latest version)
    Terraform Cloud account with Token.
    Github account with PAT.
    All the required variables/secrets are defined in the Teraform Cloud.

*Github actions*
    Terraform workflow are invoked by the Github Flow



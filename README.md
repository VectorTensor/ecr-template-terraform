# ECS Deployment with Terraform and Docker

This repository contains Terraform configurations for deploying a Python application to AWS ECS. The application is containerized using Docker, and the Terraform configuration includes the necessary resources to push the image to a container registry and deploy it to ECS.

## Prerequisites

Ensure you have the following installed:
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) (configured with the necessary credentials)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Docker](https://docs.docker.com/get-docker/)


## Deployment


### 1. Deploy with Terraform

```sh
# Initialize Terraform
terraform init

# Validate Terraform configuration
terraform validate

# Plan the deployment
terraform plan 

# Apply the deployment
terraform apply 
```


## Cleanup
To destroy the resources created by Terraform, run:

```sh
terraform destroy
```

## Notes
- Ensure that the AWS credentials used have permissions to create and manage ECS, ECR, IAM, and networking resources.


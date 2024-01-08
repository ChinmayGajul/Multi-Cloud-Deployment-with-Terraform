# Multi-Cloud-Terraform
This project demonstrates Terraform's process in setting up infrastructure on both AWS and Azure. It includes the creation of EC2 instances and Azure Virtual Machines, managing networking, and deploying resources using Terraform's configuration files.

# Terraform Deployment: EC2 & Azure Virtual Machine
This repository contains Terraform configurations to deploy infrastructure on AWS and Azure using Terraform.

## AWS EC2 Instance Deployment

### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS IAM credentials with appropriate permissions

### Steps
1. Navigate to the `aws` directory.
2. Open `main.tf` and set the AWS credentials and other required variables.
3. Run the following commands:
    ```bash
    terraform init
    terraform plan
    terraform apply
    ```
4. Access the AWS Management Console to view the deployed EC2 instance.

## Azure Virtual Machine Deployment

### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) installed
- Azure account with appropriate permissions
- Azure CLI installed and authenticated

### Steps
1. Navigate to the `azure` directory.
2. Open `main.tf` and set the Azure credentials and other required variables.
3. Run the following commands:
    ```bash
    terraform init
    terraform plan
    terraform apply
    ```
4. Access the Azure portal to view the deployed Azure Virtual Machine.

### Cleanup
Remember to run `terraform destroy` in each directory to clean up resources and avoid unwanted costs.

## Notes
- Make sure to configure variables and credentials properly before deployment.

## Conclusion

This project harnesses the power of Terraform to provision and manage infrastructure on both AWS and Azure. By utilizing Terraform's declarative configuration, it streamlines the deployment of an AWS EC2 instance and an Azure Virtual Machine.

The provided configurations in the `aws` and `azure` directories offer a hands-on experience in deploying cloud infrastructure. The README files within each directory offer detailed instructions for setting up and executing deployments.

Feel free to explore, modify, and expand upon these Terraform configurations to suit your specific infrastructure needs. Remember, always ensure proper configuration of variables and credentials, and perform cleanup using `terraform destroy` after deployment to avoid any unwanted costs.



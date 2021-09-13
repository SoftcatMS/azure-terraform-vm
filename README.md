# azure-terraform-vm

Deploys a Virtual Machine in Azure

Based of original module: https://github.com/Azure/terraform-azurerm-compute

It supports creating:

- Virtual Machine  
- Availability Set
- Public IP
- Network Security Group
- Network Security Rule
- Network Interface



## Usage Examples
Review the examples folder: [examples](./examples)


## Deployment
Perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


use terraform-docs to create Inputs and Outpus documentation  [terraform-docs](https://github.com/terraform-docs/terraform-docs)

`terraform-docs markdown .`


## Requirements
### Installed Software
The following dependencies must be installed on the development system:

- [Terraform](https://www.terraform.io/downloads.html) 

Azure  
- [Terraform Provider for Azure](https://github.com/hashicorp/terraform-provider-azurerm)
- CLI Tool [az](https://docs.microsoft.com/en-us/cli/azure/)

AWS  
- [Terraform Provider for AWS](https://github.com/hashicorp/terraform-provider-aws)
- CLI Tool [aws-cli](https://aws.amazon.com/cli/)

GCP  
- [Terraform Provider for GCP](https://github.com/hashicorp/terraform-provider-google)
- [Terraform Provider for GCP Beta](https://github.com/terraform-providers/terraform-provider-google-beta)
- CLI Tool [gcloud](https://cloud.google.com/sdk/gcloud/)






## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

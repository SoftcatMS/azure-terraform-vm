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


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_os"></a> [os](#module\_os) | ./os | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set) | resource |
| [azurerm_network_interface.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.test](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_public_ip.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_storage_account.vm-sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_virtual_machine.vm-linux](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [azurerm_virtual_machine.vm-windows](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [random_id.vm-sa](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [azurerm_public_ip.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | data source |
| [azurerm_resource_group.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure. | `string` | `""` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The admin username of the VM that will be deployed. | `string` | `"azureuser"` | no |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Defines how an IP address is assigned. Options are Static or Dynamic. | `string` | `"Dynamic"` | no |
| <a name="input_boot_diagnostics"></a> [boot\_diagnostics](#input\_boot\_diagnostics) | (Optional) Enable or Disable boot diagnostics. | `bool` | `false` | no |
| <a name="input_boot_diagnostics_sa_type"></a> [boot\_diagnostics\_sa\_type](#input\_boot\_diagnostics\_sa\_type) | (Optional) Storage account type for boot diagnostics. | `string` | `"Standard_LRS"` | no |
| <a name="input_custom_data"></a> [custom\_data](#input\_custom\_data) | The custom data to supply to the machine. This can be used as a cloud-init for Linux systems. | `string` | `""` | no |
| <a name="input_data_disk_size_gb"></a> [data\_disk\_size\_gb](#input\_data\_disk\_size\_gb) | Storage data disk size size. | `number` | `30` | no |
| <a name="input_data_sa_type"></a> [data\_sa\_type](#input\_data\_sa\_type) | Data Disk Storage Account type. | `string` | `"Standard_LRS"` | no |
| <a name="input_delete_data_disks_on_termination"></a> [delete\_data\_disks\_on\_termination](#input\_delete\_data\_disks\_on\_termination) | Delete data disks when machine is terminated. | `bool` | `false` | no |
| <a name="input_delete_os_disk_on_termination"></a> [delete\_os\_disk\_on\_termination](#input\_delete\_os\_disk\_on\_termination) | Delete datadisk when machine is terminated. | `bool` | `false` | no |
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | (Optional) Enable accelerated networking on Network interface. | `bool` | `false` | no |
| <a name="input_enable_ssh_key"></a> [enable\_ssh\_key](#input\_enable\_ssh\_key) | (Optional) Enable ssh key authentication in Linux virtual Machine. | `bool` | `true` | no |
| <a name="input_extra_disks"></a> [extra\_disks](#input\_extra\_disks) | (Optional) List of extra data disks attached to each virtual machine. | <pre>list(object({<br>    name = string<br>    size = number<br>  }))</pre> | `[]` | no |
| <a name="input_extra_ssh_keys"></a> [extra\_ssh\_keys](#input\_extra\_ssh\_keys) | Same as ssh\_key, but allows for setting multiple public keys. Set your first key in ssh\_key, and the extras here. | `list(string)` | `[]` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned to the VM. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The Managed Service Identity Type of this Virtual Machine. | `string` | `""` | no |
| <a name="input_is_windows_image"></a> [is\_windows\_image](#input\_is\_windows\_image) | Boolean flag to notify when the custom image is windows based. | `bool` | `false` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Specifies the BYOL Type for this Virtual Machine. This is only applicable to Windows Virtual Machines. Possible values are Windows\_Client and Windows\_Server | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Optional) The location in which the resources will be created. | `string` | `""` | no |
| <a name="input_nb_data_disk"></a> [nb\_data\_disk](#input\_nb\_data\_disk) | (Optional) Number of the data disks attached to each virtual machine. | `number` | `0` | no |
| <a name="input_nb_instances"></a> [nb\_instances](#input\_nb\_instances) | Specify the number of vm instances. | `number` | `1` | no |
| <a name="input_nb_public_ip"></a> [nb\_public\_ip](#input\_nb\_public\_ip) | Number of public IPs to assign corresponding to one IP per vm. Set to 0 to not assign any public IP addresses. | `number` | `1` | no |
| <a name="input_os_profile_secrets"></a> [os\_profile\_secrets](#input\_os\_profile\_secrets) | Specifies a list of certificates to be installed on the VM, each list item is a map with the keys source\_vault\_id, certificate\_url and certificate\_store. | `list(map(string))` | `[]` | no |
| <a name="input_public_ip_dns"></a> [public\_ip\_dns](#input\_public\_ip\_dns) | Optional globally unique per datacenter region domain name label to apply to each public ip address. e.g. thisvar.varlocation.cloudapp.azure.com where you specify only thisvar here. This is an array of names which will pair up sequentially to the number of public ips defined in var.nb\_public\_ip. One name or empty string is required for every public ip. If no public ip is desired, then set this to an array with a single empty string. | `list(string)` | <pre>[<br>  null<br>]</pre> | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Defines the SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Basic"` | no |
| <a name="input_remote_port"></a> [remote\_port](#input\_remote\_port) | Remote tcp port to be used for access to the vms created via the nsg applied to the nics. | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the resources will be created. | `string` | n/a | yes |
| <a name="input_source_address_prefixes"></a> [source\_address\_prefixes](#input\_source\_address\_prefixes) | (Optional) List of source address prefixes allowed to access var.remote\_port. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Path to the public key to be used for ssh access to the VM. Only used with non-Windows vms and can be left as-is even if using Windows vms. If specifying a path to a certification on a Windows machine to provision a linux vm use the / in the path versus backslash. e.g. c:/home/id\_rsa.pub. | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_ssh_key_values"></a> [ssh\_key\_values](#input\_ssh\_key\_values) | List of Public SSH Keys values to be used for ssh access to the VMs. | `list(string)` | `[]` | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | Defines the type of storage account to be created. Valid options are Standard\_LRS, Standard\_ZRS, Standard\_GRS, Standard\_RAGRS, Premium\_LRS. | `string` | `"Premium_LRS"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |
| <a name="input_vm_hostname"></a> [vm\_hostname](#input\_vm\_hostname) | local name of the Virtual Machine. | `string` | `"myvm"` | no |
| <a name="input_vm_os_id"></a> [vm\_os\_id](#input\_vm\_os\_id) | The resource ID of the image that you want to deploy if you are using a custom image.Note, need to provide is\_windows\_image = true for windows custom images. | `string` | `""` | no |
| <a name="input_vm_os_offer"></a> [vm\_os\_offer](#input\_vm\_os\_offer) | The name of the offer of the image that you want to deploy. This is ignored when vm\_os\_id or vm\_os\_simple are provided. | `string` | `""` | no |
| <a name="input_vm_os_publisher"></a> [vm\_os\_publisher](#input\_vm\_os\_publisher) | The name of the publisher of the image that you want to deploy. This is ignored when vm\_os\_id or vm\_os\_simple are provided. | `string` | `""` | no |
| <a name="input_vm_os_simple"></a> [vm\_os\_simple](#input\_vm\_os\_simple) | Specify UbuntuServer, WindowsServer, RHEL, openSUSE-Leap, CentOS, Debian, CoreOS and SLES to get the latest image version of the specified os.  Do not provide this value if a custom value is used for vm\_os\_publisher, vm\_os\_offer, and vm\_os\_sku. | `string` | `""` | no |
| <a name="input_vm_os_sku"></a> [vm\_os\_sku](#input\_vm\_os\_sku) | The sku of the image that you want to deploy. This is ignored when vm\_os\_id or vm\_os\_simple are provided. | `string` | `""` | no |
| <a name="input_vm_os_version"></a> [vm\_os\_version](#input\_vm\_os\_version) | The version of the image that you want to deploy. This is ignored when vm\_os\_id or vm\_os\_simple are provided. | `string` | `"latest"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Specifies the size of the virtual machine. | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | The subnet id of the virtual network where the virtual machines will reside. | `string` | n/a | yes |

## Outputs

No outputs.



## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

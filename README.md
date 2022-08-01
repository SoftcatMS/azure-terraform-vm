# terraform-azure-vm

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


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_os"></a> [os](#module\_os) | ./os | n/a |

# Linux VM 

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_managed_disk.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.nsgassoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.nsg_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_public_ip.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_storage_account.vm-sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_virtual_machine_data_disk_attachment.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |        
| [azurerm_virtual_machine_extension.provision_linux_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [local_sensitive_file.linux_provision_vm](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [random_id.vm-sa](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [azurerm_resource_group.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [template_file.linux_provision_vm](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure. | `string` | `""` | no |
| <a name="input_admin_ssh_key"></a> [admin\_ssh\_key](#input\_admin\_ssh\_key) | Specifies public\_key of admin user. | `string` | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The admin username of the VM that will be deployed. | `string` | `"azureuser"` | no |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Defines the allocation method for this IP address. Possible values are `Static` or `Dynamic` | `string` | `"Dynamic"` | no |
| <a name="input_allow_extension_operations"></a> [allow\_extension\_operations](#input\_allow\_extension\_operations) | Should Extension Operations be allowed on this Virtual Machine | `bool` | `true` | no |
| <a name="input_availability_set_id"></a> [availability\_set\_id](#input\_availability\_set\_id) | Specifies the ID of the Availability Set in which the Virtual Machine should exist | `string` | `null` | no |
| <a name="input_boot_diagnostics"></a> [boot\_diagnostics](#input\_boot\_diagnostics) | (Optional) Enable or Disable boot diagnostics. | `bool` | `true` | no |
| <a name="input_boot_diagnostics_sa_type"></a> [boot\_diagnostics\_sa\_type](#input\_boot\_diagnostics\_sa\_type) | (Optional) Storage account type for boot diagnostics. | `string` | `"Standard_LRS"` | no |
| <a name="input_computer_name"></a> [computer\_name](#input\_computer\_name) | Specifies the Hostname which should be used for this Virtual Machine | `string` | `""` | no |
| <a name="input_custom_data"></a> [custom\_data](#input\_custom\_data) | The Base64-Encoded Custom Data which should be used for this Virtual Machine | `string` | `null` | no |
| <a name="input_data_disks"></a> [data\_disks](#input\_data\_disks) | Managed Data Disks for azure viratual machine | <pre>list(object({<br>    name                 = string<br>    lun
      = number<br>    storage_account_type = string<br>    disk_size_gb         = number<br>    caching              = string<br>  }))</pre> | `[]` | no |
| <a name="input_dedicated_host_id"></a> [dedicated\_host\_id](#input\_dedicated\_host\_id) | The ID of a Dedicated Host where this machine should be run on | `string` | `null` | no |
| <a name="input_disable_password_authentication"></a> [disable\_password\_authentication](#input\_disable\_password\_authentication) | Should Password Authentication be disabled on this Virtual Machine? Defaults to true | `bool` | `false` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created. | `string` | `null` | no |
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | Enable accelerated networking on Network interface. | `bool` | `true` | no |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true. | `bool` | `true` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | Should IP Forwarding be enabled? Defaults to false | `bool` | `false` | no |
| <a name="input_enable_provision_script"></a> [enable\_provision\_script](#input\_enable\_provision\_script) | Use provisoning script. | `bool` | `true` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Assign public IP to vm. Default False. | `bool` | `false` | no |
| <a name="input_enable_ultra_ssd"></a> [enable\_ultra\_ssd](#input\_enable\_ultra\_ssd) | Should the capacity to enable Data Disks of the UltraSSD\_LRS storage account type be supported on this Virtual Machine | `bool` | `false` | no |
| <a name="input_encryption_at_host_enabled"></a> [encryption\_at\_host\_enabled](#input\_encryption\_at\_host\_enabled) | Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host? | `bool` | `true` | no |
| <a name="input_eviction_policy"></a> [eviction\_policy](#input\_eviction\_policy) | Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance | `string` | `null` | no |
| <a name="input_existing_network_security_group_id"></a> [existing\_network\_security\_group\_id](#input\_existing\_network\_security\_group\_id) | The resource id of existing network security group | `any` | `null` | no |
| <a name="input_extensions_time_budget"></a> [extensions\_time\_budget](#input\_extensions\_time\_budget) | Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes | `string` | `"PT1H30M"` | no |
| <a name="input_internal_dns_name_label"></a> [internal\_dns\_name\_label](#input\_internal\_dns\_name\_label) | The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network. | `any` | `null` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Specifies the BYOL Type for this Virtual Machine. Possible values are RHEL\_BYOS and SLES\_BYOS. | `string` | `null` | no |
| <a name="input_linux_provision_script"></a> [linux\_provision\_script](#input\_linux\_provision\_script) | Path to Linux provisioning script. | `string` | `"./scripts/linux_provision_vm.sh"` | no |
| <a name="input_location"></a> [location](#input\_location) | (Optional) The location in which the resources will be created. | `string` | `""` | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | The type of Managed Identity which should be assigned to the Linux Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned` | `any` | `null` | no |
| <a name="input_max_bid_price"></a> [max\_bid\_price](#input\_max\_bid\_price) | The maximum price you're willing to pay for this Virtual Machine, in US Dollars | `number` | `null` | no |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The minimum supported TLS version for the storage account. Possible values are TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLS1\_2. | `string` | `"TLS1_2"` | no |
| <a name="input_name"></a> [name](#input\_name) | name of the azure vm | `string` | n/a | yes |
| <a name="input_network_interface_ids"></a> [network\_interface\_ids](#input\_network\_interface\_ids) | A list of Network Interface ID's which should be associated with the Virtual Machine | `list(string)` | `[]` | no |
| <a name="input_nsg_inbound_rules"></a> [nsg\_inbound\_rules](#input\_nsg\_inbound\_rules) | List of network rules to apply to network interface. | `list` | `[]` | no |
| <a name="input_os_disk"></a> [os\_disk](#input\_os\_disk) | os disk reference block | `list(map(string))` | `[]` | no |
| <a name="input_os_disk_caching"></a> [os\_disk\_caching](#input\_os\_disk\_caching) | The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite. | `string` | `"ReadWrite"` | no |
| <a name="input_os_disk_encryption_set_id"></a> [os\_disk\_encryption\_set\_id](#input\_os\_disk\_encryption\_set\_id) | The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk. | `string` | `null` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | OS disk size (GB). | `number` | `30` | no |
| <a name="input_os_disk_storage_account_type"></a> [os\_disk\_storage\_account\_type](#input\_os\_disk\_storage\_account\_type) | The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard\_LRS, StandardSSD\_LRS, Premium\_LRS, StandardSSD\_ZRS and Premium\_ZRS. Changing this forces a new resource to be created. | `string` | `"Premium_LRS"` | no |  
| <a name="input_os_disk_write_accelerator_enabled"></a> [os\_disk\_write\_accelerator\_enabled](#input\_os\_disk\_write\_accelerator\_enabled) | Should Write Accelerator be Enabled for this OS Disk? Defaults to false. | `bool` | `false` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | image details form the market place | `list(map(string))` | `[]` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Specifies the duration allocated for all extensions to start | `string` | `"Regular"` | no |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | Defines static IP address to assign to VM. private\_ip\_address\_allocation must be set to Static. | `string` | `"Dynamic"` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Defines how an IP address is assigned. Options are Static or Dynamic. | `string` | `"Dynamic"` | no |
| <a name="input_private_ip_address_allocation_type"></a> [private\_ip\_address\_allocation\_type](#input\_private\_ip\_address\_allocation\_type) | The allocation method used for the Private IP Address. Possible values are Dynamic and Static. | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true | `bool` | `true` | no |
| <a name="input_proximity_placement_group_id"></a> [proximity\_placement\_group\_id](#input\_proximity\_placement\_group\_id) | proximity\_placement\_group\_id | `string` | `null` | no |
| <a name="input_public_ip_address_allocation"></a> [public\_ip\_address\_allocation](#input\_public\_ip\_address\_allocation) | Defines how an IP address is assigned. Options are Static or Dynamic. | `string` | `"Dynamic"` | no |
| <a name="input_public_ip_dns"></a> [public\_ip\_dns](#input\_public\_ip\_dns) | Optional globally unique per datacenter region domain name label to apply to each public ip address. e.g. thisvar.varlocation.cloudapp.azure.com where you specify only thisvar here. This is an array of names which will pair up sequentially to the number of public ips defined in var.nb\_public\_ip. One name or empty string is required for every public ip. If no public ip is desired, then set this to an array with a single empty string. | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Defines the SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Basic"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the resources will be created. | `string` | n/a | yes |  
| <a name="input_secret"></a> [secret](#input\_secret) | Specifies a list of certificates to be installed on the VM and the KeyVault where certificate is stored | `list(map(string))` | `[]` | no | 
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | CIDR or source IP range or * to match any IP. Tags such as 'VirtualNetwork', 'AzureLoadBalancer' and 'Internet' can also be used. This is required if source\_address\_prefixes is not specified. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_source_address_prefixes"></a> [source\_address\_prefixes](#input\_source\_address\_prefixes) | (Optional) List of source address prefixes allowed to access var.remote\_port. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_source_image_id"></a> [source\_image\_id](#input\_source\_image\_id) | The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created | `string` | `null` | no |
| <a name="input_source_image_offer"></a> [source\_image\_offer](#input\_source\_image\_offer) | Specifies the offer of the image used to create the virtual machines. | `string` | n/a | yes |      
| <a name="input_source_image_publisher"></a> [source\_image\_publisher](#input\_source\_image\_publisher) | Specifies the publisher of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_source_image_reference"></a> [source\_image\_reference](#input\_source\_image\_reference) | Virtual Machine source image information. See https://www.terraform.io/docs/providers/azurerm/r/virtual_machine.html#storage_image_reference. This variable cannot be used if `vm_image_id` is already defined. | `any` | `{}` | no |
| <a name="input_source_image_sku"></a> [source\_image\_sku](#input\_source\_image\_sku) | Specifies the SKU of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_source_image_version"></a> [source\_image\_version](#input\_source\_image\_version) | Specifies the version of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | `{}` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Should the capacity to enable Data Disks of the UltraSSD\_LRS storage account type be supported on this Virtual Machine? Defaults to false. | `bool` | `false` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The Base64-Encoded User Data scripts which should be passed to this Virtual Machine at provisioning. | `any` | `null` | no |     
| <a name="input_virtual_machine_scale_set_id"></a> [virtual\_machine\_scale\_set\_id](#input\_virtual\_machine\_scale\_set\_id) | Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within | `string` | `null` | no |
| <a name="input_virtual_machine_size"></a> [virtual\_machine\_size](#input\_virtual\_machine\_size) | Specifies the size of the virtual machine. | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_vm_availability_zone"></a> [vm\_availability\_zone](#input\_vm\_availability\_zone) | The Zone in which this Virtual Machine should be created. Conflicts with availability set and 
shouldn't use both | `any` | `null` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | The subnet id of the virtual network where the virtual machines will reside. | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | A list of a single item of the Availability Zone which the Virtual Machine should be allocated in | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_interface_private_ip"></a> [network\_interface\_private\_ip](#output\_network\_interface\_private\_ip) | private ip addresses of the vm nics |
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | id of the security group provisioned |
| <a name="output_network_security_group_name"></a> [network\_security\_group\_name](#output\_network\_security\_group\_name) | name of the security group provisioned |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | The actual ip address allocated for the resource. |
| <a name="output_public_ip_dns_name"></a> [public\_ip\_dns\_name](#output\_public\_ip\_dns\_name) | fqdn to connect to the first vm provisioned. |
| <a name="output_public_ip_id"></a> [public\_ip\_id](#output\_public\_ip\_id) | id of the public ip address provisoned. |
| <a name="output_virtual_machine_id"></a> [virtual\_machine\_id](#output\_virtual\_machine\_id) | Virtual machine ids created. |
| <a name="output_virtual_machine_private_ips"></a> [virtual\_machine\_private\_ips](#output\_virtual\_machine\_private\_ips) | ids of the vm nics provisoned. |

# Windows VM

## Resources

| Name | Type |
|------|------|
| [azurerm_managed_disk.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.nsgassoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.nsg_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_public_ip.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_storage_account.vm-sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_virtual_machine_data_disk_attachment.data_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |        
| [azurerm_virtual_machine_extension.provision_windows_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension) | resource |
| [azurerm_windows_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |
| [local_sensitive_file.windows_provision_vm](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [random_id.vm-sa](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [azurerm_resource_group.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [template_file.windows_provision_vm](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_unattend_content"></a> [additional\_unattend\_content](#input\_additional\_unattend\_content) | The XML formatted content that is added to the unattend.xml file for the 
specified path and component. | `any` | `null` | no |
| <a name="input_additional_unattend_content_setting"></a> [additional\_unattend\_content\_setting](#input\_additional\_unattend\_content\_setting) | The name of the setting to which the content applies. Possible values are `AutoLogon` and `FirstLogonCommands` | `any` | `null` | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure. | `string` | `""` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The admin username of the VM that will be deployed. | `string` | `"azureuser"` | no |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Defines the allocation method for this IP address. Possible values are `Static` or `Dynamic` | `string` | `"Dynamic"` | no |
| <a name="input_allow_extension_operations"></a> [allow\_extension\_operations](#input\_allow\_extension\_operations) | Should Extension Operations be allowed on this Virtual Machine | `bool` | `true` | no |
| <a name="input_availability_set_id"></a> [availability\_set\_id](#input\_availability\_set\_id) | Specifies the ID of the Availability Set in which the Virtual Machine should exist | `string` | `null` | no |
| <a name="input_boot_diagnostics"></a> [boot\_diagnostics](#input\_boot\_diagnostics) | (Optional) Enable or Disable boot diagnostics. | `bool` | `true` | no |
| <a name="input_boot_diagnostics_sa_type"></a> [boot\_diagnostics\_sa\_type](#input\_boot\_diagnostics\_sa\_type) | (Optional) Storage account type for boot diagnostics. | `string` | `"Standard_LRS"` | no |
| <a name="input_computer_name"></a> [computer\_name](#input\_computer\_name) | Specifies the Hostname which should be used for this Virtual Machine | `string` | `""` | no |
| <a name="input_custom_data"></a> [custom\_data](#input\_custom\_data) | The Base64-Encoded Custom Data which should be used for this Virtual Machine | `string` | `null` | no |
| <a name="input_data_disks"></a> [data\_disks](#input\_data\_disks) | Managed Data Disks for azure viratual machine | <pre>list(object({<br>    name                 = string<br>    lun
      = number<br>    storage_account_type = string<br>    disk_size_gb         = number<br>    caching              = string<br>  }))</pre> | `[]` | no |
| <a name="input_dedicated_host_id"></a> [dedicated\_host\_id](#input\_dedicated\_host\_id) | The ID of a Dedicated Host where this machine should be run on | `string` | `null` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created. | `string` | `null` | no |
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | Enable accelerated networking on Network interface. | `bool` | `true` | no |
| <a name="input_enable_automatic_updates"></a> [enable\_automatic\_updates](#input\_enable\_automatic\_updates) | Specifies if Automatic Updates are Enabled for the Windows Virtual Machine. | `bool` | `true` | no |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true. | `bool` | `true` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | Should IP Forwarding be enabled? Defaults to false | `bool` | `false` | no |
| <a name="input_enable_provision_script"></a> [enable\_provision\_script](#input\_enable\_provision\_script) | Use provisoning script. | `bool` | `true` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Assign public IP to vm. Default False. | `bool` | `false` | no |
| <a name="input_enable_ultra_ssd"></a> [enable\_ultra\_ssd](#input\_enable\_ultra\_ssd) | Should the capacity to enable Data Disks of the UltraSSD\_LRS storage account type be supported on this Virtual Machine | `bool` | `false` | no |
| <a name="input_encryption_at_host_enabled"></a> [encryption\_at\_host\_enabled](#input\_encryption\_at\_host\_enabled) | Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host? | `bool` | `true` | no |
| <a name="input_eviction_policy"></a> [eviction\_policy](#input\_eviction\_policy) | Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance | `string` | `null` | no |
| <a name="input_existing_network_security_group_id"></a> [existing\_network\_security\_group\_id](#input\_existing\_network\_security\_group\_id) | The resource id of existing network security group | `any` | `null` | no |
| <a name="input_extensions_time_budget"></a> [extensions\_time\_budget](#input\_extensions\_time\_budget) | Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes | `string` | `"PT1H30M"` | no |
| <a name="input_internal_dns_name_label"></a> [internal\_dns\_name\_label](#input\_internal\_dns\_name\_label) | The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network. | `any` | `null` | no |
| <a name="input_key_vault_certificate_secret_url"></a> [key\_vault\_certificate\_secret\_url](#input\_key\_vault\_certificate\_secret\_url) | The Secret URL of a Key Vault Certificate, which must 
be specified when `protocol` is set to `Https` | `any` | `null` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Specifies the BYOL Type for this Virtual Machine. Possible values are RHEL\_BYOS and SLES\_BYOS. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (Optional) The location in which the resources will be created. | `string` | `""` | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | The type of Managed Identity which should be assigned to the Linux Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned` | `any` | `null` | no |
| <a name="input_max_bid_price"></a> [max\_bid\_price](#input\_max\_bid\_price) | The maximum price you're willing to pay for this Virtual Machine, in US Dollars | `number` | `null` | no |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The minimum supported TLS version for the storage account. Possible values are TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLS1\_2. | `string` | `"TLS1_2"` | no |
| <a name="input_name"></a> [name](#input\_name) | name of the azure vm | `string` | n/a | yes |
| <a name="input_network_interface_ids"></a> [network\_interface\_ids](#input\_network\_interface\_ids) | A list of Network Interface ID's which should be associated with the Virtual Machine | `list(string)` | `[]` | no |
| <a name="input_nsg_inbound_rules"></a> [nsg\_inbound\_rules](#input\_nsg\_inbound\_rules) | List of network rules to apply to network interface. | `list` | `[]` | no |
| <a name="input_os_disk"></a> [os\_disk](#input\_os\_disk) | os disk reference block | `list(map(string))` | `[]` | no |
| <a name="input_os_disk_caching"></a> [os\_disk\_caching](#input\_os\_disk\_caching) | The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite. | `string` | `"ReadWrite"` | no |
| <a name="input_os_disk_encryption_set_id"></a> [os\_disk\_encryption\_set\_id](#input\_os\_disk\_encryption\_set\_id) | The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk. | `string` | `null` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | OS disk size (GB). | `number` | `150` | no |
| <a name="input_os_disk_storage_account_type"></a> [os\_disk\_storage\_account\_type](#input\_os\_disk\_storage\_account\_type) | The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard\_LRS, StandardSSD\_LRS, Premium\_LRS, StandardSSD\_ZRS and Premium\_ZRS. Changing this forces a new resource to be created. | `string` | `"Premium_LRS"` | no |  
| <a name="input_os_disk_write_accelerator_enabled"></a> [os\_disk\_write\_accelerator\_enabled](#input\_os\_disk\_write\_accelerator\_enabled) | Should Write Accelerator be Enabled for this OS Disk? Defaults to false. | `bool` | `false` | no |
| <a name="input_patch_mode"></a> [patch\_mode](#input\_patch\_mode) | Specifies the mode of in-guest patching to this Windows Virtual Machine. Possible values are `Manual`, `AutomaticByOS` and `AutomaticByPlatform` | `string` | `"AutomaticByOS"` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | image details form the market place | `list(map(string))` | `[]` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Specifies the duration allocated for all extensions to start | `string` | `"Regular"` | no |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | Defines static IP address to assign to VM. private\_ip\_address\_allocation must be set to Static. | `string` | `"Dynamic"` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Defines how an IP address is assigned. Options are Static or Dynamic. | `string` | `"Dynamic"` | no |
| <a name="input_private_ip_address_allocation_type"></a> [private\_ip\_address\_allocation\_type](#input\_private\_ip\_address\_allocation\_type) | The allocation method used for the Private IP Address. Possible values are Dynamic and Static. | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true | `bool` | `true` | no |
| <a name="input_proximity_placement_group_id"></a> [proximity\_placement\_group\_id](#input\_proximity\_placement\_group\_id) | proximity\_placement\_group\_id | `string` | `null` | no |
| <a name="input_public_ip_address_allocation"></a> [public\_ip\_address\_allocation](#input\_public\_ip\_address\_allocation) | Defines how an IP address is assigned. Options are Static or Dynamic. | `string` | `"Dynamic"` | no |
| <a name="input_public_ip_dns"></a> [public\_ip\_dns](#input\_public\_ip\_dns) | Optional globally unique per datacenter region domain name label to apply to each public ip address. e.g. thisvar.varlocation.cloudapp.azure.com where you specify only thisvar here. This is an array of names which will pair up sequentially to the number of public ips defined in var.nb\_public\_ip. One name or empty string is required for every public ip. If no public ip is desired, then set this to an array with a single empty string. | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Defines the SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | `"Basic"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the resources will be created. | `string` | n/a | yes |  
| <a name="input_secret"></a> [secret](#input\_secret) | Specifies a list of certificates to be installed on the VM and the KeyVault where certificate is stored | `list(map(string))` | `[]` | no | 
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | CIDR or source IP range or * to match any IP. Tags such as 'VirtualNetwork', 'AzureLoadBalancer' and 'Internet' can also be used. This is required if source\_address\_prefixes is not specified. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_source_address_prefixes"></a> [source\_address\_prefixes](#input\_source\_address\_prefixes) | (Optional) List of source address prefixes allowed to access var.remote\_port. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_source_image_id"></a> [source\_image\_id](#input\_source\_image\_id) | The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created | `string` | `null` | no |
| <a name="input_source_image_offer"></a> [source\_image\_offer](#input\_source\_image\_offer) | Specifies the offer of the image used to create the virtual machines. | `string` | n/a | yes |      
| <a name="input_source_image_publisher"></a> [source\_image\_publisher](#input\_source\_image\_publisher) | Specifies the publisher of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_source_image_reference"></a> [source\_image\_reference](#input\_source\_image\_reference) | Virtual Machine source image information. See https://www.terraform.io/docs/providers/azurerm/r/virtual_machine.html#storage_image_reference. This variable cannot be used if `vm_image_id` is already defined. | `any` | `{}` | no |
| <a name="input_source_image_sku"></a> [source\_image\_sku](#input\_source\_image\_sku) | Specifies the SKU of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_source_image_version"></a> [source\_image\_version](#input\_source\_image\_version) | Specifies the version of the image used to create the virtual machines. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | `{}` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Should the capacity to enable Data Disks of the UltraSSD\_LRS storage account type be supported on this Virtual Machine? Defaults to false. | `bool` | `false` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The Base64-Encoded User Data scripts which should be passed to this Virtual Machine at provisioning. | `any` | `null` | no |     
| <a name="input_virtual_machine_scale_set_id"></a> [virtual\_machine\_scale\_set\_id](#input\_virtual\_machine\_scale\_set\_id) | Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within | `string` | `null` | no |
| <a name="input_virtual_machine_size"></a> [virtual\_machine\_size](#input\_virtual\_machine\_size) | Specifies the size of the virtual machine. | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_vm_availability_zone"></a> [vm\_availability\_zone](#input\_vm\_availability\_zone) | The Zone in which this Virtual Machine should be created. Conflicts with availability set and 
shouldn't use both | `any` | `null` | no |
| <a name="input_vm_time_zone"></a> [vm\_time\_zone](#input\_vm\_time\_zone) | Specifies the Time Zone which should be used by the Virtual Machine | `any` | `null` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | The subnet id of the virtual network where the virtual machines will reside. | `string` | n/a | yes |
| <a name="input_windows_provision_script"></a> [windows\_provision\_script](#input\_windows\_provision\_script) | Path to Windows provisioning script. | `string` | `"./scripts/windows_provision_vm.ps1"` | no |
| <a name="input_winrm_protocol"></a> [winrm\_protocol](#input\_winrm\_protocol) | Specifies the protocol of winrm listener. Possible values are `Http` or `Https` | `any` | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | A list of a single item of the Availability Zone which the Virtual Machine should be allocated in | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_interface_private_ip"></a> [network\_interface\_private\_ip](#output\_network\_interface\_private\_ip) | private ip addresses of the vm nics |
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | id of the security group provisioned |
| <a name="output_network_security_group_name"></a> [network\_security\_group\_name](#output\_network\_security\_group\_name) | name of the security group provisioned |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | The actual ip address allocated for the resource. |
| <a name="output_public_ip_dns_name"></a> [public\_ip\_dns\_name](#output\_public\_ip\_dns\_name) | fqdn to connect to the first vm provisioned. |
| <a name="output_public_ip_id"></a> [public\_ip\_id](#output\_public\_ip\_id) | id of the public ip address provisoned. |
| <a name="output_virtual_machine_id"></a> [virtual\_machine\_id](#output\_virtual\_machine\_id) | Virtual machine ids created. |
| <a name="output_virtual_machine_private_ips"></a> [virtual\_machine\_private\_ips](#output\_virtual\_machine\_private\_ips) | ids of the vm nics provisoned. |


## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

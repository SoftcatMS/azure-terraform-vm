
## Linux

variable "name" {
  description = "name of the azure vm"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}

variable "location" {
  description = "(Optional) The location in which the resources will be created."
  type        = string
  default     = ""
}

variable "license_type" {
  description = "Specifies the BYOL Type for this Virtual Machine. Possible values are RHEL_BYOS and SLES_BYOS."
  type        = string
  default     = null
}

variable "virtual_machine_size" {
  description = "Specifies the size of the virtual machine."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "The admin username of the VM that will be deployed."
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure."
  type        = string
  default     = ""
  sensitive   = true
}

variable "network_interface_ids" {
  description = "A list of Network Interface ID's which should be associated with the Virtual Machine"
  type        = list(string)
  default     = []
}

variable "provision_vm_agent" {
  description = "Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true"
  type        = bool
  default     = true
}

variable "source_image_id" {
  description = "The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created"
  type        = string
  default     = null
}

variable "allow_extension_operations" {
  description = "Should Extension Operations be allowed on this Virtual Machine"
  type        = bool
  default     = true
}

variable "extensions_time_budget" {
  description = "Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes"
  type        = string
  default     = "PT1H30M"
}

variable "dedicated_host_id" {
  description = "The ID of a Dedicated Host where this machine should be run on"
  type        = string
  default     = null
}

variable "computer_name" {
  description = "Specifies the Hostname which should be used for this Virtual Machine"
  type        = string
  default     = ""
}

variable "custom_data" {
  description = "The Base64-Encoded Custom Data which should be used for this Virtual Machine"
  type        = string
  default     = null
}

variable "disable_password_authentication" {
  description = "Should Password Authentication be disabled on this Virtual Machine? Defaults to true"
  type        = bool
  default     = false
}

variable "encryption_at_host_enabled" {
  description = "Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
  type        = bool
  default     = true
}

variable "eviction_policy" {
  description = "Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance"
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Linux Virtual Machine should exist. Changing this forces a new Linux Virtual Machine to be created."
  type        = string
  default     = null
}

variable "max_bid_price" {
  description = "The maximum price you're willing to pay for this Virtual Machine, in US Dollars"
  type        = number
  default     = null
}

variable "priority" {
  description = "Specifies the duration allocated for all extensions to start"
  type        = string
  default     = "Regular"
}

variable "proximity_placement_group_id" {
  description = "proximity_placement_group_id"
  type        = string
  default     = null
}

variable "ultra_ssd_enabled" {
  description = " Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine? Defaults to false."
  type        = bool
  default     = false
}


variable "virtual_machine_scale_set_id" {
  description = "Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within"
  type        = string
  default     = null
}

variable "availability_set_id" {
  description = "Specifies the ID of the Availability Set in which the Virtual Machine should exist"
  type        = string
  default     = null
}

variable "zones" {
  description = "A list of a single item of the Availability Zone which the Virtual Machine should be allocated in"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of the tags to use on the resources that are deployed with this module."
  type        = map(string)
  default     = {}
}

# secret vars
variable "secret" {
  description = "Specifies a list of certificates to be installed on the VM and the KeyVault where certificate is stored"
  type        = list(map(string))
  default     = []
}


# os disk vars
variable "os_disk" {
  description = "os disk reference block"
  type        = list(map(string))
  default     = []
}

# additional capabilities vars
variable "enable_ultra_ssd" {
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine"
  type        = bool
  default     = false
}

# admin ssh key vars
variable "admin_ssh_key" {
  description = "Specifies public_key of admin user."
  type        = string
  default     = null
}

# source_image_reference reference vars
variable "source_image_reference" {
  description = "Virtual Machine source image information. See https://www.terraform.io/docs/providers/azurerm/r/virtual_machine.html#storage_image_reference. This variable cannot be used if `vm_image_id` is already defined."
  type        = any
  default     = {}
}


variable "min_tls_version" {
  description = " The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2."
  type        = string
  default     = "TLS1_2"
}

variable "enable_https_traffic_only" {
  type        = bool
  description = "Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true."
  default     = true
}

variable "boot_diagnostics" {
  type        = bool
  description = "(Optional) Enable or Disable boot diagnostics."
  default     = true
}

variable "boot_diagnostics_sa_type" {
  description = "(Optional) Storage account type for boot diagnostics."
  type        = string
  default     = "Standard_LRS"
}

# plan vars
variable "plan" {
  description = "image details form the market place"
  type        = list(map(string))
  default     = []
}

# identity vars
variable "managed_identity_type" {
  description = "The type of Managed Identity which should be assigned to the Linux Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`"
  default     = null
}


variable "private_ip_address_allocation" {
  description = "Defines how an IP address is assigned. Options are Static or Dynamic."
  type        = string
  default     = "Dynamic"
}

variable "private_ip_address" {
  description = "Defines static IP address to assign to VM. private_ip_address_allocation must be set to Static."
  type        = string
  default     = "Dynamic"
}

variable "enable_ip_forwarding" {
  description = "Should IP Forwarding be enabled? Defaults to false"
  default     = false
}

variable "enable_public_ip" {
  description = "Assign public IP to vm. Default False."
  type        = bool
  default     = false
}

variable "internal_dns_name_label" {
  description = "The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  default     = null
}

variable "private_ip_address_allocation_type" {
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
  default     = "Dynamic"
}

variable "public_ip_address_allocation" {
  description = "Defines how an IP address is assigned. Options are Static or Dynamic."
  type        = string
  default     = "Dynamic"
}

variable "public_ip_sku" {
  description = "Defines the SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  type        = string
  default     = "Basic"
}

variable "public_ip_dns" {
  description = "Optional globally unique per datacenter region domain name label to apply to each public ip address. e.g. thisvar.varlocation.cloudapp.azure.com where you specify only thisvar here. This is an array of names which will pair up sequentially to the number of public ips defined in var.nb_public_ip. One name or empty string is required for every public ip. If no public ip is desired, then set this to an array with a single empty string."
  type        = string
  default     = null
}

variable "enable_accelerated_networking" {
  type        = bool
  description = "Enable accelerated networking on Network interface."
  default     = true
}

variable "source_address_prefixes" {
  description = "(Optional) List of source address prefixes allowed to access var.remote_port."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP. Tags such as 'VirtualNetwork', 'AzureLoadBalancer' and 'Internet' can also be used. This is required if source_address_prefixes is not specified."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "vnet_subnet_id" {
  description = "The subnet id of the virtual network where the virtual machines will reside."
  type        = string
}

variable "os_disk_size_gb" {
  description = "OS disk size (GB)."
  type        = number
  default     = 30
}

variable "os_disk_storage_account_type" {
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created."
  type        = string
  default     = "Premium_LRS"
}

variable "os_disk_caching" {
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk."
  type        = string
  default     = null
}

variable "os_disk_write_accelerator_enabled" {
  description = "Should Write Accelerator be Enabled for this OS Disk? Defaults to false."
  type        = bool
  default     = false
}


variable "source_image_publisher" {
  description = "Specifies the publisher of the image used to create the virtual machines."
  type        = string
}

variable "source_image_offer" {
  description = "Specifies the offer of the image used to create the virtual machines."
  type        = string
}

variable "source_image_sku" {
  description = "Specifies the SKU of the image used to create the virtual machines."
  type        = string
}

variable "source_image_version" {
  description = "Specifies the version of the image used to create the virtual machines."
  type        = string
}

variable "existing_network_security_group_id" {
  description = "The resource id of existing network security group"
  default     = null
}

variable "nsg_inbound_rules" {
  description = "List of network rules to apply to network interface."
  default     = []
}

variable "allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are `Static` or `Dynamic`"
  default     = "Dynamic"
}


variable "data_disks" {
  description = "Managed Data Disks for azure viratual machine"
  type = list(object({
    name                 = string
    lun                  = number
    storage_account_type = string
    disk_size_gb         = number
    caching              = string
  }))
  default = []
}


variable "vm_availability_zone" {
  description = "The Zone in which this Virtual Machine should be created. Conflicts with availability set and shouldn't use both"
  default     = null
}

variable "user_data" {
  description = "The Base64-Encoded User Data scripts which should be passed to this Virtual Machine at provisioning."
  default     = null
}

variable "enable_provision_script" {
  description = "Use provisoning script."
  type        = bool
  default     = true
}

variable "linux_provision_script" {
  description = "Path to Linux provisioning script."
  type        = string
  default     = "./scripts/linux_provision_vm.sh"
}

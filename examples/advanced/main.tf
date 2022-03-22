resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "UK South"
}

data "azurerm_key_vault" "example" {
  name                = "examplekeyvault"
  resource_group_name = azurerm_resource_group.example.name
}

data "azurerm_key_vault_certificate" "example" {
  name         = "example-kv-cert"
  key_vault_id = data.azurerm_key_vault.example.id
}

module "linuxservers" {
  source                           = "github.com/SoftcatMS/terraform-azure-vm"
  resource_group_name              = azurerm_resource_group.example.name
  vm_hostname                      = "mylinuxvm"
  nb_public_ip                     = 0
  remote_port                      = "22"
  nb_instances                     = 2
  vm_os_publisher                  = "Canonical"
  vm_os_offer                      = "UbuntuServer"
  vm_os_sku                        = "18.04-LTS"
  vnet_subnet_id                   = module.vnet.vnet_subnets[0]
  boot_diagnostics                 = true
  delete_os_disk_on_termination    = true
  nb_data_disk                     = 2
  data_disk_size_gb                = 64
  data_sa_type                     = "Premium_LRS"
  enable_ssh_key                   = true
  ssh_key_values                   = ["ssh-rsa AAAAB3NzaC1yc2EAAAAD..."]
  vm_size                          = "Standard_D4s_v3"
  delete_data_disks_on_termination = true

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  enable_accelerated_networking = true
}

module "windowsservers" {
  source                        = "github.com/SoftcatMS/terraform-azure-vm"
  resource_group_name           = azurerm_resource_group.example.name
  vm_hostname                   = "mywinvm"
  is_windows_image              = true
  admin_password                = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  allocation_method             = "Static"
  public_ip_sku                 = "Standard"
  public_ip_dns                 = ["winterravmip", "winterravmip1"] // change to a unique name per datacenter region
  nb_public_ip                  = 2
  remote_port                   = "3389"
  nb_instances                  = 2
  vm_os_publisher               = "MicrosoftWindowsServer"
  vm_os_offer                   = "WindowsServer"
  vm_os_sku                     = "2012-R2-Datacenter"
  vm_size                       = "Standard_DS2_V2"
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  enable_accelerated_networking = true
  license_type                  = "Windows_Client"
  identity_type                 = "SystemAssigned" // can be empty, SystemAssigned or UserAssigned

  extra_disks = [
    {
      size = 50
      name = "logs"
    },
    {
      size = 200
      name = "backup"
    }
  ]

  os_profile_secrets = [{
    source_vault_id   = data.azurerm_key_vault.example.id
    certificate_url   = data.azurerm_key_vault_certificate.example.secret_id
    certificate_store = "My"
  }]
}




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
  source                          = "github.com:SoftcatMS/terraform-azure-vm/modules/linux-vm"
  name                            = "linux-example"
  resource_group_name             = azurerm_resource_group.example.name
  location                        = azurerm_resource_group.example.location
  virtual_machine_size            = "Standard_B1ls"
  disable_password_authentication = true
  enable_public_ip                = true
  public_ip_dns                   = "linuxexamplemip" // change to a unique name per datacenter region
  vnet_subnet_id                  = module.vnet.vnet_subnets[0]
  enable_accelerated_networking   = false
  admin_ssh_key                   = tls_private_key.test_key.public_key_openssh

  os_disk = [{
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }]

  source_image_publisher = "Canonical"
  source_image_offer     = "UbuntuServer"
  source_image_sku       = "16.04-LTS"
  source_image_version   = "latest"

  data_disks = [
    {
      name                 = "disk1"
      lun                  = 1
      disk_size_gb         = 100
      storage_account_type = "StandardSSD_LRS"
      caching              = "ReadWrite"
    },
    {
      name                 = "disk2"
      lun                  = 2
      disk_size_gb         = 200
      storage_account_type = "Standard_LRS"
      caching              = "ReadWrite"
    }
  ]


  nsg_inbound_rules = [
    {
      name                       = "ssh-in"
      destination_port_range     = "22"
      destination_address_prefix = "10.1.1.0/24"
      source_address_prefix      = "*"
    },
  ]


  depends_on = [azurerm_resource_group.example]
}




module "windowsserver" {
  source                        = "github.com:SoftcatMS/terraform-azure-vm/modules/windows-vm"
  name                          = "windows-example"
  resource_group_name           = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  virtual_machine_size          = "Standard_B1ls"
  admin_password                = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  enable_public_ip              = true
  public_ip_dns                 = "wintestadvancedvmip" // change to a unique name per datacenter region
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  enable_accelerated_networking = false
  secret                        = [data.azurerm_key_vault.example.id]


  source_image_publisher = "MicrosoftWindowsServer"
  source_image_offer     = "WindowsServer"
  source_image_sku       = "2019-Datacenter"
  source_image_version   = "latest"


  os_disk = [{
    disk_size_gb         = 150
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }]


  data_disks = [
    {
      name                 = "disk1"
      lun                  = 1
      disk_size_gb         = 100
      storage_account_type = "StandardSSD_LRS"
      caching              = "ReadWrite"
    },
    {
      name                 = "disk2"
      lun                  = 2
      disk_size_gb         = 200
      storage_account_type = "Standard_LRS"
      caching              = "ReadWrite"
    }
  ]


  nsg_inbound_rules = [
    {
      name                       = "rdp"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "10.1.1.0/24"
    },
    {
      name                       = "http"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "10.1.1.0/24"
    },
  ]


  depends_on = [azurerm_resource_group.example]
}


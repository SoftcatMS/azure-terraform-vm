resource "azurerm_resource_group" "rg-vm-test-basic" {
  name     = "rg-test-vm-basic-resources"
  location = "UK South"
}

module "vnet" {

  source              = "github.com/SoftcatMS/azure-terraform-vnet"
  vnet_name           = "vnet-test-basic"
  resource_group_name = azurerm_resource_group.rg-vm-test-basic.name
  address_space       = ["10.1.0.0/16"]
  subnet_prefixes     = ["10.1.1.0/24"]
  subnet_names        = ["subnet1"]

  tags = {
    environment = "test"
    engineer    = "ci/cd"
  }

  depends_on = [azurerm_resource_group.rg-vm-test-basic]
}

# No provisioning script
module "linuxservers" {
  source                          = "../../modules/linux-vm"
  name                            = "linux-test-vm"
  resource_group_name             = azurerm_resource_group.rg-vm-test-basic.name
  location                        = azurerm_resource_group.rg-vm-test-basic.location
  virtual_machine_size            = "Standard_B1ls"
  admin_password                  = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  disable_password_authentication = false
  enable_public_ip                = true
  public_ip_dns                   = "linuxtestbasicvmip" // change to a unique name per datacenter region
  vnet_subnet_id                  = lookup(module.vnet.vnet_subnets_name_id, "subnet1")
  enable_accelerated_networking   = false
  enable_provision_script         = false
  user_data                       = "aG9zdG5hbWU="

  os_disk = [{
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }]

  source_image_publisher = "Canonical"
  source_image_offer     = "UbuntuServer"
  source_image_sku       = "16.04-LTS"
  source_image_version   = "latest"


  nsg_inbound_rules = [
    {
      name                       = "ssh-in"
      destination_port_range     = "22"
      destination_address_prefix = "10.1.1.0/24"
      source_address_prefix      = "*"
    },
    {
      name                       = "https"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "10.1.1.0/24"
    }
  ]


  depends_on = [azurerm_resource_group.rg-vm-test-basic]
}


# No provisioning script
module "windowsserver" {
  source                        = "../../modules/windows-vm"
  name                          = "wintest-vm"
  resource_group_name           = azurerm_resource_group.rg-vm-test-basic.name
  location                      = azurerm_resource_group.rg-vm-test-basic.location
  virtual_machine_size          = "Standard_B1ls"
  admin_password                = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  enable_public_ip              = true
  public_ip_dns                 = "wintestbasicvmip" // change to a unique name per datacenter region
  vnet_subnet_id                = lookup(module.vnet.vnet_subnets_name_id, "subnet1")
  enable_accelerated_networking = false
  enable_provision_script       = false

  source_image_publisher = "MicrosoftWindowsServer"
  source_image_offer     = "WindowsServer"
  source_image_sku       = "2019-Datacenter"
  source_image_version   = "latest"


  os_disk = [{
    disk_size_gb         = 150
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }]


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

  depends_on = [azurerm_resource_group.rg-vm-test-basic]
}

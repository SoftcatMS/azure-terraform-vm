resource "azurerm_resource_group" "rg-vm-test-advanced" {
  name     = "rg-test-vm-advanced-resources"
  location = "UK South"
}

module "vnet" {
  source              = "github.com/SoftcatMS/azure-terraform-vnet"
  vnet_name           = "vnet-test-advanced"
  resource_group_name = azurerm_resource_group.rg-vm-test-advanced.name
  address_space       = ["10.2.0.0/16"]
  subnet_prefixes     = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  subnet_enforce_private_link_endpoint_network_policies = {
    "subnet1" : true
  }

  subnet_service_endpoints = {
    "subnet1" : ["Microsoft.Sql"],
    "subnet2" : ["Microsoft.Sql"],
    "subnet3" : ["Microsoft.Sql"]
  }

  tags = {
    environment = "test"
    engineer    = "ci/cd"
  }

  depends_on = [azurerm_resource_group.rg-vm-test-advanced]
}

module "linuxservers" {
  source                           = "../../"
  resource_group_name              = azurerm_resource_group.rg-vm-test-advanced.name
  vm_hostname                      = "linux-test-vm"
  vm_size                          = "Standard_B1ls"
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
  data_sa_type                     = "Standard_LRS"
  enable_ssh_key                   = true
  ssh_key                          = "dummy_rsa.pub"
  delete_data_disks_on_termination = true

  depends_on = [azurerm_resource_group.rg-vm-test-advanced]
}

module "windowsservers" {
  source                        = "../../"
  resource_group_name           = azurerm_resource_group.rg-vm-test-advanced.name
  vm_hostname                   = "win-test-vm"
  vm_size                       = "Standard_D2_v4"
  is_windows_image              = true
  admin_password                = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  allocation_method             = "Static"
  public_ip_sku                 = "Standard"
  public_ip_dns                 = ["linuxtestbasicvmip1", "linuxtestbasicvmip2"]
  nb_public_ip                  = 1
  remote_port                   = "3389"
  nb_instances                  = 1
  vm_os_publisher               = "MicrosoftWindowsServer"
  vm_os_offer                   = "WindowsServer"
  vm_os_sku                     = "2012-R2-Datacenter"
  vnet_subnet_id                = module.vnet.vnet_subnets[0]
  enable_accelerated_networking = true
  data_sa_type                  = "Standard_LRS"
  storage_account_type          = "Standard_LRS"
  license_type                  = "Windows_Client"
  identity_type                 = "SystemAssigned" // can be empty, SystemAssigned or UserAssigned

  depends_on = [azurerm_resource_group.rg-vm-test-advanced]
}

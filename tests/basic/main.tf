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

module "linuxservers" {
  source              = "../../"
  resource_group_name = azurerm_resource_group.rg-vm-test-basic.name
  vm_size             = "Standard_B1ls"
  vm_hostname         = "linux-test-vm"
  admin_password      = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["linuxtestvmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = module.vnet.vnet_subnets[0]
  enable_ssh_key      = false

  depends_on = [azurerm_resource_group.rg-vm-test-basic]
}

module "windowsservers" {
  source              = "../../"
  resource_group_name = azurerm_resource_group.rg-vm-test-basic.name
  vm_size             = "Standard_B1ls"
  vm_hostname         = "win-test-vm"
  is_windows_image    = true
  admin_password      = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  vm_os_simple        = "WindowsServer"
  public_ip_dns       = ["wintestvmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = module.vnet.vnet_subnets[0]

  depends_on = [azurerm_resource_group.rg-vm-test-basic]
}

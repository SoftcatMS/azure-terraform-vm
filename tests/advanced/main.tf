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
  source              = "../../"
  resource_group_name = azurerm_resource_group.rg-vm-test-advanced.name
  vm_size             = "Standard_B1ls"
  vm_hostname         = "linux-test-vm"
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["linuxtestvmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = module.vnet.vnet_subnets[0]
  enable_ssh_key      = true
  ssh_key             = "dummy_rsa.pub"

  depends_on = [azurerm_resource_group.rg-vm-test-advanced]
}

module "windowsservers" {
  source              = "../../"
  resource_group_name = azurerm_resource_group.rg-vm-test-advanced.name
  vm_size             = "Standard_B1ls"
  vm_hostname         = "win-test-vm"
  is_windows_image    = true
  admin_password      = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  vm_os_simple        = "WindowsServer"
  public_ip_dns       = ["wintestvmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = module.vnet.vnet_subnets[0]

  depends_on = [azurerm_resource_group.rg-vm-test-advanced]
}

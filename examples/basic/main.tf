resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "UK South"
}

module "linuxservers" {
  source              = "git@github.com:SoftcatMS/terraform-azure-vm"
  resource_group_name = azurerm_resource_group.example.name
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = module.vnet.vnet_subnets[0]

  depends_on = [azurerm_resource_group.example]
}

module "windowsservers" {
  source              = "git@github.com:SoftcatMS/terraform-azure-vm"
  resource_group_name = azurerm_resource_group.example.name
  is_windows_image    = true
  vm_hostname         = "mywinvm"         // line can be removed if only one VM module per resource group
  admin_password      = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  vm_os_simple        = "WindowsServer"
  public_ip_dns       = ["winsimplevmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = module.vnet.vnet_subnets[0]

  depends_on = [azurerm_resource_group.example]
}

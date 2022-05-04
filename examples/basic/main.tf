resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "UK South"
}

module "linuxservers" {
  source                          = "github.com/SoftcatMS/terraform-azure-vm/modules/linux-vm"
  name                            = "linux-example"
  resource_group_name             = azurerm_resource_group.example.name
  location                        = azurerm_resource_group.example.location
  virtual_machine_size            = "Standard_B1ls"
  disable_password_authentication = true
  enable_public_ip                = true
  public_ip_dns                   = "linuxexamplemip" // change to a unique name per datacenter region
  vnet_subnet_id                  = module.vnet.vnet_subnets[0]
  enable_accelerated_networking   = false

  os_disk = [{
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }]

  source_image_publisher = "Canonical"
  source_image_offer     = "UbuntuServer"
  source_image_sku       = "16.04-LTS"
  source_image_version   = "laexample"

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


  tags = {
    environment = "test"
    engineer    = "ci/cd"
  }


  depends_on = [azurerm_resource_group.example]
}


module "windowsservers" {
  source              = "github.com/SoftcatMS/terraform-azure-vm"
  resource_group_name = azurerm_resource_group.example.name
  is_windows_image    = true
  vm_hostname         = "mywinvm"         // line can be removed if only one VM module per resource group
  admin_password      = "ComplxP@ssw0rd!" // Password should not be provided in plain text. Use secrets
  vm_os_simple        = "WindowsServer"
  public_ip_dns       = ["winsimplevmips"] // change to a unique name per datacenter region
  vnet_subnet_id      = module.vnet.vnet_subnets[0]

  depends_on = [azurerm_resource_group.example]
}

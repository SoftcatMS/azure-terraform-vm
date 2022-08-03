output "virtual_machine_id" {
  description = "Virtual machine ids created."
  value       = azurerm_linux_virtual_machine.vm.id
}

output "network_security_group_id" {
  description = "id of the security group provisioned"
  value       = azurerm_network_security_group.vm.*.id
}

output "network_security_group_name" {
  description = "name of the security group provisioned"
  value       = azurerm_network_security_group.vm.*.name
}

output "virtual_machine_private_ips" {
  description = "ids of the vm nics provisoned."
  value       = zipmap(azurerm_linux_virtual_machine.vm.*.name, azurerm_linux_virtual_machine.vm.*.private_ip_address)
}

output "network_interface_private_ip" {
  description = "private ip addresses of the vm nics"
  value       = azurerm_network_interface.vm.private_ip_address
}

output "public_ip_id" {
  description = "id of the public ip address provisoned."
  value       = azurerm_public_ip.vm.*.id
}

output "public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = azurerm_public_ip.vm.*.ip_address
}

output "public_ip_dns_name" {
  description = "fqdn to connect to the first vm provisioned."
  value       = azurerm_public_ip.vm.*.fqdn
}

output "os_disk_name" {
  description = "id of the vm os disk provisioned"
  value       = azurerm_linux_virtual_machine.vm.os_disk[0].name
}

output "os_disk_type" {
  description = "disk type of the vm os disk provisioned"
  value       = azurerm_linux_virtual_machine.vm.os_disk[0].storage_account_type
}

output "data_disk_ids" {
  description = "ids of the vm data disks provisioned"
  value       = [ for dd in azurerm_managed_disk.data_disk : dd.id ]
}

output "network_interface_id" {
  description = "id of the vm nic provisioned"
  value       = azurerm_network_interface.vm.id 
}

output "data_disk_types" {
  description = "ids of the vm data disks provisioned"
  value       = [ for dd in azurerm_managed_disk.data_disk : dd.storage_account_type ]
}
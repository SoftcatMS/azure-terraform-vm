output "virtual_machine_id" {
  description = "Virtual machine ids created."
  value       = azurerm_windows_virtual_machine.vm.id
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
  value       = zipmap(azurerm_windows_virtual_machine.vm.*.name, azurerm_windows_virtual_machine.vm.*.private_ip_address)
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

output "os_disk_id" {
  description = "id of the VM OS disk"
  value       = azurerm_windows_virtual_machine.vm.os_disk.id
}

output "os_disk_type" {
  description = "VM OS disk type"
  value       = azurerm_windows_virtual_machine.vm.os_disk.storage_account_type
}

output "data_disk_ids" {
  description = "id of the VM data disks"
  value       = azurerm_managed_disk.data_disk.*.id
}

output "data_disk_types" {
  description = "VM data disk types"
  value       = azurerm_managed_disk.data_disk.*.storage_account_type
}

output "network_interface_id" {
  description = "VM network interface id"
  value       = azurerm_network_interface.vm.id 
}
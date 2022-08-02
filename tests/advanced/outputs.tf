output "windows_virtual_machine_id" {
  description = "Virtual machine ids created."
  value       = module.windowsserver.virtual_machine_id
}

output "windows_network_security_group_id" {
  description = "id of the security group provisioned"
  value       = module.windowsserver.network_security_group_id
}

output "windows_network_security_group_name" {
  description = "name of the security group provisioned"
  value       = module.windowsserver.network_security_group_name
}

output "windows_virtual_machine_private_ips" {
  description = "ids of the vm nics provisoned."
  value       = module.windowsserver.virtual_machine_private_ips
}

output "windows_network_interface_private_ip" {
  description = "private ip addresses of the vm nics"
  value       = module.windowsserver.network_interface_private_ip
}

output "windows_public_ip_id" {
  description = "id of the public ip address provisoned."
  value       = module.windowsserver.public_ip_id
}

output "windows_public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = module.windowsserver.public_ip_address
}

output "windows_public_ip_dns_name" {
  description = "fqdn to connect to the first vm provisioned."
  value       = module.windowsserver.public_ip_dns_name
}

output "windows_os_disk_name" {
  description = "id of the vm os disk provisioned"
  value       = module.windowsserver.os_disk_name
}

output "windows_os_disk_type" {
  description = "disk type of the vm os disk provisioned"
  value       = module.windowsserver.os_disk_type
}

output "windows_data_disk_ids" {
  description = "ids of the vm data disks provisioned"
  value       = module.windowsserver.data_disk_ids
}

output "windows_network_interface_id" {
  description = "id of the vm nic provisioned"
  value       = module.windowsserver.network_interface_id
}

output "linux_virtual_machine_id" {
  description = "Virtual machine ids created."
  value       = module.linuxserver.virtual_machine_id
}

output "linux_network_security_group_id" {
  description = "id of the security group provisioned"
  value       = module.linuxserver.network_security_group_id
}

output "linux_network_security_group_name" {
  description = "name of the security group provisioned"
  value       = module.linuxserver.network_security_group_name
}

output "linux_virtual_machine_private_ips" {
  description = "ids of the vm nics provisoned."
  value       = module.linuxserver.virtual_machine_private_ips
}

output "linux_network_interface_private_ip" {
  description = "private ip addresses of the vm nics"
  value       = module.linuxserver.network_interface_private_ip
}

output "linux_public_ip_id" {
  description = "id of the public ip address provisoned."
  value       = module.linuxserver.public_ip_id
}

output "linux_public_ip_address" {
  description = "The actual ip address allocated for the resource."
  value       = module.linuxserver.public_ip_address
}

output "linux_public_ip_dns_name" {
  description = "fqdn to connect to the first vm provisioned."
  value       = module.linuxserver.public_ip_dns_name
}

output "linux_os_disk_name" {
  description = "id of the vm os disk provisioned"
  value       = module.linuxserver.os_disk_name
}

output "linux_os_disk_type" {
  description = "disk type of the vm os disk provisioned"
  value       = module.linuxserver.os_disk_type
}

output "linux_data_disk_ids" {
  description = "ids of the vm data disks provisioned"
  value       = module.linuxserver.data_disk_ids
}

output "linux_network_interface_id" {
  description = "id of the vm nic provisioned"
  value       = module.linuxserver.network_interface_id
}
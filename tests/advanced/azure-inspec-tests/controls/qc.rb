# copyright: 2018, The Authors

# Test values

resource_group1 = 'rg-test-vm-advanced-resources'


describe azure_virtual_machine(resource_group: resource_group1, name: 'linux-test-vm-vmLinux-0') do
  it { should exist }
  its('os_disk_name') { should match 'linux-test-vm-osdisk-0' }
end


describe azure_virtual_machine(resource_group: resource_group1, name: 'win-test-vm-vmWindows-0') do
  it { should exist }
  its('os_disk_name') { should match 'win-test-vm-osdisk-0' }

end
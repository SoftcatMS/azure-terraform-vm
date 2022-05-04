# copyright: 2018, The Authors

# Test values

resource_group1 = 'rg-test-vm-basic-resources'


describe azure_virtual_machine(resource_group: resource_group1, name: 'linux-test-vm') do
  it { should exist }
  its('os_disk_name') { should match 'linux-test-vm-osdisk' }
end


describe azure_virtual_machine(resource_group: resource_group1, name: 'wintest-vm') do
  it { should exist }
  its('os_disk_name') { should match 'wintest-vm-osdisk' }

end
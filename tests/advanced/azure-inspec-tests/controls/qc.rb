# copyright: 2018, The Authors

# Test values

resource_group1 = 'rg-test-vm-advanced-resources'


describe azure_virtual_machine(resource_group: resource_group1, name: 'linux-test-vm-adv') do
  it { should exist }
  its('os_disk_name') { should match 'linux-test-vm-adv-osdisk' }
end


describe azure_virtual_machine(resource_group: resource_group1, name: 'wintest-vm-adv') do
  it { should exist }
  its('os_disk_name') { should match 'wintest-vm-adv-osdisk' }

end
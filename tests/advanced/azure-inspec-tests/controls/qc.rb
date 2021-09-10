# copyright: 2018, The Authors

# Test values

resource_group1 = 'rg-test-advanced-resources'
vnet1 = "vnet-test-advanced"


describe azure_virtual_network(resource_group: resource_group1, name: vnet1) do
  it { should exist }
  its('location')  { should eq 'uksouth' }
  its('address_space') { should eq ["10.2.0.0/16"] }
end

describe azure_subnet(resource_group: resource_group1, vnet: vnet1, name: 'subnet1') do
  it { should exist }
  its('address_prefix') { should eq "10.2.1.0/24" }
end

describe azure_subnet(resource_group: resource_group1, vnet: vnet1, name: 'subnet2') do
  it { should exist }
  its('address_prefix') { should eq "10.2.2.0/24" }
end

describe azure_subnet(resource_group: resource_group1, vnet: vnet1, name: 'subnet3') do
  it { should exist }
  its('address_prefix') { should eq "10.2.3.0/24" }
end


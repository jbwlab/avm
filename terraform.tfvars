location = "westeurope"
tags = {
  type = "avm"
  env  = "demo"
}
address_space_start_ip = "10.0.0.0"
address_space_size     = 22
subnets = {
  AzureBastionSubnet = {
    size                       = 26
    has_nat_gateway            = false
    has_network_security_group = false
  }
  private_endpoints = {
    size                       = 28
    has_nat_gateway            = false
    has_network_security_group = true
  }
  virtual_machines = {
    size                       = 24
    has_nat_gateway            = true
    has_network_security_group = false
  }
}
terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "azurerm" {}
}

provider "azurerm" {}


resource "azurerm_network_security_group" "security_group" {
  name                = "sg-${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.rg_name}"
  tags                = "${var.tags}"
}


resource "azurerm_network_security_rule" "security_rules" {
  count                       = "${length(var.security_rules)}"
  name                        = "sr-${lookup(var.security_rules[count.index], "name", "default_rule_name")}"
  priority                    = "${lookup(var.security_rules[count.index], "priority", "200")}"
  direction                   = "${lookup(var.security_rules[count.index], "direction", "Any")}"
  access                      = "${lookup(var.security_rules[count.index], "access", "Allow")}"
  protocol                    = "${lookup(var.security_rules[count.index], "protocol", "*")}"
  source_port_ranges          = ["${split(",", "${lookup(var.security_rules[count.index], "source_port_range", "*" )}" )}"]
  destination_port_ranges     = ["${split(",", "${lookup(var.security_rules[count.index], "destination_port_range", "*" )}" )}"]
  source_address_prefix       = "${lookup(var.security_rules[count.index], "source_address_prefix", "*")}"
  destination_address_prefix  = "${lookup(var.security_rules[count.index], "destination_address_prefix", "*")}"
  description                 = "${lookup(var.security_rules[count.index], "description", "Security rule for ${lookup(var.security_rules[count.index], "name", "default_rule_name")}")}"
  resource_group_name         = "${var.rg_name}"
  network_security_group_name = "${azurerm_network_security_group.security_group.name}"
}
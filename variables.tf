variable "location" {
    description = "The Azure Region in which the Resource Group exists"
}

variable "rg_name" {
    description = "The name of the Resource Group where VM resources will be created"
}

variable "name" {
 description = "The security group name"
}


# [priority, direction, access, protocol, source_port_range, destination_port_range, description]"
# All the fields are required.
variable "security_rules" {
  description = "Security rules for the network security group using this format name = [priority, direction, access, protocol, source_port_range, destination_port_range, source_address_prefix, destination_address_prefix, description]"
  type        = "list"
  default     = []
}

variable "tags" {
    description = "List of tags should be associated on all ressoruces"
    type = "map"
    default = {
        module = "module-azure-security"
    }
}





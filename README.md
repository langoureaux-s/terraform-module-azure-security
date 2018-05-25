# terraform-module-azure-security

This module permit to security group and some security rules associated to it.

```
terragrunt = {
  terraform {
    source = "git::https://github.com/langoureaux-s/terraform-module-security.git"
  }
  
  location              = "West Europe"
  rg_name               = "bigdata"
  name                  = "myproject"
  security_rules        = [
                            {
                              name                   = "http"
                              priority               = "200"
                              direction              = "Inbound"
                              access                 = "Allow"
                              protocol               = "tcp"
                              destination_port_range = "80"
                              description            = "Http web server"
                            },
                            {
                              name                   = "ssh"
                              priority               = "200"
                              direction              = "Inbound"
                              access                 = "Allow"
                              protocol               = "tcp"
                              destination_port_range = "22"
                              description            = "Openssh server"
                            }
                        ]
  tags                  = {
                            environment = "test"
                            project = "test"
                        }
}
```
locals {
  squad_locations = {
    "Arnaud_G" = "westeurope",
  }
}

locals {
  subscription_id       = "c56aea2c-50de-4adc-9673-6a8008892c21"
  group_subscription_id = "/subscriptions/c56aea2c-50de-4adc-9673-6a8008892c21/resourceGroups/Arnaud_G"
  squad_name            = "Arnaud-G"
  rg_name               = "Arnaud_G" #local.squad_name
}

# Définit les valeurs locales du Vnet et Subnet

locals {
  regions = {
    westeu = {
      vnet_name     = "${local.squad_name}-vnet-westeu"
      address_space = ["192.168.0.0/16"]
      location      = "westeurope"
      subnets       = ["${local.squad_name}-vm-redhat"] # Sous-réseau pour cette région
    }
  }

  #Variables pour la VM redhat

  redhat_ip_name                = "${local.squad_name}-redhat-ip"
  nic_name                     = "${local.squad_name}-redhat-nic"
  dns_redhat                    = "arnaud-g-redhat-dns"
  vm_app_name                  = "${local.squad_name}-redhat-vm"
  size                         = "Standard_DS2_v2"
  location                     = "westeurope"
  storage_account_type_os_disk = "Standard_LRS"
  os_disk_name                 = "redhat-os-disk"
  caching                      = "ReadWrite"
  publisher                    = "RedHat"
  offer                        = "RHEL"
  sku                          = "88-gen2"
}
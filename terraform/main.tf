# Appel du module network - Création de l'infrastructure réseau
module "network" {
  source = "./modules/network" # Chemin vers le module

  for_each = local.regions # Pour chaque région définie dans locals.tf

  vnet_name           = each.value.vnet_name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = local.rg_name
  subnets             = each.value.subnets
}

# Appel du module vm - creation de la VM RedHat
module "redhat_vm" {
  source = "./modules/redhatvm"

  dns_prefix                   = local.dns_redhat
  nic_name                     = local.nic_name
  ip_name                      = local.redhat_ip_name
  subnet_id                    = module.network["westeu"].vnet_subnets_ids[0]
  name                         = local.vm_app_name
  size                         = local.size
  location                     = local.location
  resource_group_name          = local.rg_name
  storage_account_type_os_disk = local.storage_account_type_os_disk
  os_disk_name                 = local.os_disk_name
  caching                      = local.caching
  publisher                    = local.publisher
  offer                        = local.offer
  sku                          = local.sku
}






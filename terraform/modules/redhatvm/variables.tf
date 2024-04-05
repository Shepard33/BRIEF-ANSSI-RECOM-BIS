# NIC
# Nom de la carte réseau (NIC)
variable "nic_name" {
  type        = string
  description = "Nom de la carte réseau (NIC)"
}

# Nom de l'adresse IP publique
variable "ip_name" {
  type        = string
  description = "Nom de l'adresse IP publique"
}

# ID du sous-réseau pour la NIC
variable "subnet_id" {
  type        = string
  description = "ID du sous-réseau pour la NIC"
}

### VM ###
# Generic
variable "name" {
  type        = string
  description = "Nom de la machine virtuelle"
}

variable "size" {
  type        = string
  description = "Taille de la machine virtuelle"
}

variable "location" {
  type        = string
  description = "La région Azure dans laquelle la machine virtuelle sera déployée"
}

variable "resource_group_name" {
  type        = string
  description = "Nom du groupe de ressources Azure dans lequel la machine virtuelle sera créée"
}

# OS Disk
variable "storage_account_type_os_disk" {
  type        = string
  description = "Type de compte de stockage pour le disque OS"
}

variable "os_disk_name" {
  type        = string
  description = "Nom du disque OS de la machine virtuelle"
}

variable "caching" {
  type        = string
  description = "Type de mise en cache du disque OS"
}

# Référence de l'image source
variable "publisher" {
  type        = string
  description = "Éditeur de l'image source"
}

variable "offer" {
  type        = string
  description = "Offre de l'image source"
}

variable "sku" {
  type        = string
  description = "SKU de l'image source"
}

# Label de nom de domaine
variable "dns_prefix" {
  type        = string
  description = "Label de nom de domaine pour la machine virtuelle"
}
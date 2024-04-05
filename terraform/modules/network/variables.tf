# Nom du réseau virtuel
variable "vnet_name" {
  type        = string
  description = "Nom du réseau virtuel"
}

# Espace d'adressage pour le réseau virtuel
variable "address_space" {
  type        = list(string)
  description = "Espace d'adressage pour le réseau virtuel"
}

# La région Azure dans laquelle le réseau virtuel sera déployé
variable "location" {
  type        = string
  description = "La région Azure dans laquelle le réseau virtuel sera déployé"
}

# Nom du groupe de ressources Azure dans lequel le réseau virtuel sera créé
variable "resource_group_name" {
  type        = string
  description = "Nom du groupe de ressources Azure dans lequel le réseau virtuel sera créé"
}

# Liste des sous-réseaux du réseau virtuel
variable "subnets" {
  type        = list(string)
  description = "Liste des sous-réseaux du réseau virtuel"
}
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_ssh_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.root}/ssh_keys/${var.name}"
  file_permission = "0600"
}

resource "azurerm_public_ip" "ip-public" {
  name                = "ip-public-redhat"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = var.dns_prefix
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.ip-public.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "virtual_machine" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.size
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_username = "azureuser"
  admin_ssh_key {
    public_key = tls_private_key.ssh_key.public_key_openssh
    username   = "azureuser"
  }

  os_disk {
    name                 = var.os_disk_name
    caching              = var.caching
    storage_account_type = var.storage_account_type_os_disk
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }
} 

# Provision the VM using Ansible

# resource "null_resource" "ansible_provisioning" {
#   # Ensures Ansible runs after the VM is provisioned
#   depends_on = [azurerm_linux_virtual_machine.virtual_machine]


# provisioner "local-exec" {
#     command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u azureuser --private-key '/Users/Arnaud/Documents/ANSSI-RECOM/terraform/ssh_keys/Arnaud-G-redhat-vm' -i '${azurerm_public_ip.ip-public.ip_address},' /Users/Arnaud/Documents/ANSSI-RECOM/ansible/playbook.yml"
#   }
# }

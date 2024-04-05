output "fqdn" {
  value = azurerm_public_ip.ip-public.fqdn
}

output "ssh_private_key_file" {
  value = local_file.private_ssh_key.filename
}
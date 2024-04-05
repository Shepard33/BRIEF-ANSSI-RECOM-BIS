## BRIEF ANSSI-RECOM

#### Contexte: durcissement d'une VM Redhat

#### Requierements:

Compte Azure avec un resource-group

Terraform

Ansible

Vscode


### Application du code Terraform pour le deploiement de la VM

Repertoire terraform

``terraform init``
``terraform plan``
``terraform apply``


### Connection à la VM en SSH

``ssh -i /ANSSI-RECOM/terraform/ssh_keys/[squad_name]-redhat-vm azureuser@[squad_name]-dns.westeurope.cloudapp.azure.com``

``sudo yum update``

``sudo yum install openscap-scanner``

``sudo yum install scap-security-guide``

``oscap info "/usr/share/xml/scap/ssg/content/ssg-rhel8-xccdf.xml"``

# résultats

Title: ANSSI-BP-028 (minimal)
Id: xccdf_org.ssgproject.content_profile_anssi_bp28_minimal

# génération du rapport de vulnérabilités minimal & intermédiaire

sudo oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_anssi_bp28_minimal --results /tmp/rapport.xml --report /tmp/rapportvmredhatminimal.html /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml

sudo oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_anssi_bp28_intermediary --results /tmp/rapport.xml --report /tmp/rapportvmredhatintermediary.html /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml

# générer le playbook asocié

sudo oscap xccdf generate fix --profile xccdf_org.ssgproject.content_profile_anssi_bp28_minimal --fix-type ansible /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml > playbook-minimal.yml

sudo oscap xccdf generate fix --profile xccdf_org.ssgproject.content_profile_anssi_bp28_intermediary --fix-type ansible /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml > playbook-intermediary.yml

# Connexion en sftp à la Vm

sftp -i /Users/Arnaud/Documents/ANSSI-RECOM/terraform/ssh_keys/Arnaud-G-redhat-vm azureuser@arnaud-g-redhat-dns.westeurope.cloudapp.azure.com

# récupération du rapport html

get tmp/rapportvmredhatminimal.html
get tmp/rapportvmredhatintermediary.html

# récupération des playbooks

get playbook-minimal.yml
get playbook-intermediary.yml

# Jouer le playbook

ansible-playbook -i inventaire.ini playbook.yml  

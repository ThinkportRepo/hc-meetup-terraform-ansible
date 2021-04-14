# HashiCorp Meetup 2021-04-15
This Meetup talk covers the configuration of terraform for proxmox and the usage of ansible to configure vms and containers created with terraform on an proxmox system. 

# Prepare your Systemsetup

## Install Proxmox

_Version: 6.3-6_

Installation of proxmox is described in the proxmox online documentation and not covered in this repository and talk.
Visit [first steps][link-proxmox-first-steps] üpage of the proxmox website to download the system and get a walkthrough of the installation.

## Install Container Template

To launch a lxc container we need to setup a image template. Go to local storage > [CT Templates][link-select-template] and click templates to install one or more container templates.

## Setup VM template via Ansible
The project ships a playbook [_playbook-setup-proxmox.yml_][playbook-proxmox] to setup the proxmox system with a ubuntu 20.04 cloud init template.
```bash
cd ansible
ansible-playbook playbook-setup-proxmox.yml
```

## Setup Terraform

_Version: 0.14.9_

Terraform can be installed from the HashiCorp [download][link-terraform-dl] page.

Next take a look at the [README][readme-terraform] to setup the proxmox provider.tf file in the [terraform][folder-terraform] folder.

## Setup Ansible

_Version: 2.9.19_

Ansible has an installation guide in its great documentation.

## Setup with Vagrant

_Version: 2.2.14_

To avoid installing terraform, ansible and other needed dependecies manually, we prefere a vagrant box that setups the needed software for the current project. Why do with preferre it? 
Imagin you have different customers running different versions of terraform or ansible to provision and configure their systems, to avoid switching between version, every customer can get a own vagrant box with the need versions to automate their systems. 

To use HashiCorp Vagrant you need a virtualization provider. For this sample you need to use virtual box.

# Provisioning and Configuration
If you want to use the vagrant box please connect via ssh.
```bash
vagrant ssh
```

## Check VM template
Check if you run the VM template playbook, if not do it now.

```bash
cd ansible
ansible-playbook playbook-setup-proxmox.yml
```

## Provision VMs with Terraform
Change to the terraform folder.
```bash
cd ~/terraform
```
Create a file called local.tfvars and add your root@pam password for proxmox
```bash
touch local.tfvars
```
add
```bash
pm_password = "your-password"
```

Init Terroform and run the plan command with your local vars file.
```bash
terraform init

terraform plan -var-file=local.tfvars
```

Provision the VMs with
```bash
terraform apply -var-file=local.tfvars
```

## Configure VMs with Ansible
Change to the ansible folder.
```bash
cd ~/ansible
```

First check if ansible is able to connect your vms
```
ansible-playbook playbook-connection-test.yml
```

After the check is done and all lights are green we can now configure our k8s cluster.
```bash
ansible-playbook playbook-setup-lab.yml
```

When the configuration is finished we can connect to the master vm and check the nodes or copy the kube config to start interacting with the k8s cluster.

# Clean up
To remove all infrastructe let terrafrom destroy everything.
```bash
cd ~/terraform
terraform destroy -var-file=local.tfvars
```
# Useful Links
* [https://norocketscience.at/](https://norocketscience.at/deploy-proxmox-virtual-machines-using-cloud-init/)
* [https://forum.proxmox.com/](https://forum.proxmox.com/)
* [Telmate Proxmox](https://registry.terraform.io/providers/Telmate/proxmox/2.6.7/docs)


[//]: # (Links used in the document.)

[link-proxmox-first-steps]: https://www.proxmox.com/de/proxmox-ve/erste-schritte
[link-terraform-dl]: https://www.terraform.io/downloads.html
[link-ansible-install]: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
[link-select-template]: https://proxmox/#v1:0:=storage%2Fproxmox%2Flocal:4::=contentVztmpl::30:::
[link-upload-vm-image]: https://proxmox/#v1:0:=storage%2Fproxmox%2Flocal:4::=contentIso::30:::
[link-ubuntu-cloud-image-dl]: https://cloud-images.ubuntu.com/focal/20210401/focal-server-cloudimg-amd64.img
[folder-terraform]: terraform
[readme-terraform]: terraform/README.md
[playbook-proxmox]: ansible/playbook-setup-proxmox.yml
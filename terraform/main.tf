module "kub_master" {
  source   = "./pve-vm"
  vmid     = "204"
  hostname = "vm-k8s-master"

  pm_api_url  = var.pm_api_url
  pm_user     = var.pm_user
  pm_password = var.pm_password
}

module "kub_node1" {
  source   = "./pve-vm"
  vmid     = "205"
  hostname = "vm-k8s-node1"

  pm_api_url  = var.pm_api_url
  pm_user     = var.pm_user
  pm_password = var.pm_password
}

module "kub_node2" {
  source   = "./pve-vm"
  vmid     = "206"
  hostname = "vm-k8s-node2"

  pm_api_url  = var.pm_api_url
  pm_user     = var.pm_user
  pm_password = var.pm_password
}

module "web-server" {
  source       = "./lxc-container"
  vmid         = "207"
  storage_size = "10GB"
  hostname     = "lxc-web-server"

  pm_api_url  = var.pm_api_url
  pm_user     = var.pm_user
  pm_password = var.pm_password
}

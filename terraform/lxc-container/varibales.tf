variable "os_image_id" {
  default = "local:vztmpl/debian-10-standard_10.5-1_amd64.tar.gz"
}

variable "ssh_key" {
  default   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCbkfvbaqAAinP1Vy9HPvVUCfhv8f3DURN1vhpeQNYzBDwKr5X0Y6PNqxOKbc2lbfy8/ShvlY22dJwX5odweQFMTZApG//h1K1/mOGH2rlV3jyP+S1C49VIgEY/LHupjSzfuOM6k7I5DK513WBMEOmMYUu0BPoTu6PW/qf+EPtKYHxsIZC0EwWrF+C1LoUtF02CH1mjYRT1TdaB26D8iMgreP/nTj/gbCOfsK6OpJSBYv5HYWkhTpfwbHr4zk6lBRWABe0n0Cvo/Q7p8TQVgUNNfQvTQ3IcRlt9QixftL2n9mR36dogKwsZcFWYjIJ3mraXetAhIFLT8Grgbn1mRpC4o5+2eWxVFRT+BEJKFgBYcBt5f81kpUS7/eE5gmWzzx1jN6O/2Ip2AC4FidE5Ve51YcgISlO6SRt69PeCZPdKgrrmtbQHzEwW1X1mcMcFBvY3184xS4bMbSVYfiOTGhpJKt02ZbeZyCZA52+xE2hl8UpQDV2kHAtI7S5IIV/wz0M7X8kRf8TknOCD8Tc759TtpSgzTnQwApTf9G78bj4wpwboxSE8N4mav+D3U1+ASFrxuOXDqyD6quO52RrEolhrPQIRBqAPn61j8nG1S5IwDdd+eCfWsXbS1bXWG+mI2vHpiUD1jlRvBx4hS8OJQOIrDuX5+Kat09EHV9rdJqn/iQ=="
  sensitive = true
}

variable "hostname" {
  default = "lxc-terraform-created-01"
}

variable "cores" {
  default = 3
}

variable "memory" {
  default = 4096
}

variable "password" {
  default = "secure123$"
}

variable "firewall" {
  default = false
}

variable "start" {
  default = true
}

variable "vmid" {
  default = "200"
}

variable "pool" {
  default = "terraform"
}

variable "unprivileged" {
  default = true
}

variable "storage_size" {
  default = "8GB"
}

variable "storage" {
  default = "local-zfs"
  type    = string
}

variable "pm_api_url" {
}

variable "pm_user" {
}

variable "pm_password" {
  sensitive = true
}

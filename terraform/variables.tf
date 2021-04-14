variable "pm_api_url" {
  default = "https://192.168.178.7/api2/json"
}

variable "pm_user" {
  default = "root@pam"
}

variable "pm_password" {
  default   = ""
  sensitive = true
}

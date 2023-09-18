###VM vars

variable "vm_db_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_db_platform" {
  type = map(string)
  default = {
    name = "netology-develop-platform-db"
    platform = "standard-v1"
  }
}

variable "vm_db_resources" {
  type = map(number)
  default = {
    cores = 2
    memory = 2
    core_fraction = 20
  }
}
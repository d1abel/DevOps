###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4M2vsQmTXs9xyHqLjZHNix5Oz48iMfd2QumX5uHYcs vagrant@server1.netology"
  description = "ssh-keygen -t ed25519"
}

###VM vars

variable "serial-port-enable" {
  type = number
  default = 1
}

variable "vm_web_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_platform" {
  type = map(string)
  default = {
    school = "netology"
    level = "develop"
    type = "platform"
    name = "web"
    platform = "standard-v1"
  }
}

variable "vm_web_resources" {
  type = map(number)
  default = {
    cores = 2
    memory = 1
    core_fraction = 5
  }
}
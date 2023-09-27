variable "cluster_name" {
  type = string
}

variable "network_id" {
  type = string
}

variable "subnet_a" {
  type = string
}

variable "subnet_b" {
  type = string
  default = ""
}

variable "subnet_c" {
  type = string
  default = ""
}
variable "HA" {
  type = bool
}

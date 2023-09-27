variable "subnet_zone" {
  type = string
}

variable "cidr4" {
  type = list(string)
}

variable "labels" {
  description = "for dynamic block 'labels' "
  type        = map(string)
  default = {}
}

variable "env_name" {
  type    = string
  default = null
}

variable "subnet_name" {
  type = string
}

variable "net_name" {
  type = string
}
#variable "subnet_zone" {
#  type = string
#}
#
#variable "cidr4" {
#  type = list(string)
#}

variable "labels" {
  description = "for dynamic block 'labels' "
  type        = map(string)
  default = {}
}

variable "env_name" {
  type    = string
  default = null
}

variable "subnets" {
  type = list(object({zone = string, cidr = string}))
}
#
#variable "subnet_name" {
#  type = string
#}

variable "net_name" {
  type = string
}
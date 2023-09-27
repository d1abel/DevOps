terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

locals {
  labels = length(keys(var.labels)) >0 ? var.labels: {
    "env"=var.env_name
    "project"="undefined"
  }
}

resource "yandex_vpc_network" "vpc_network" {
  name = var.net_name
}

resource "yandex_vpc_subnet" "vpc_subnet" {
  for_each = {for key, value in var.subnets : key => value}

  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = [each.value.cidr]
  zone = each.value.zone
}
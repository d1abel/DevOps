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
  name = "develop"
}

resource "yandex_vpc_subnet" "vpc_subnet" {
  name = "develop"
  zone = var.subnet_zone
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = var.cidr4
}
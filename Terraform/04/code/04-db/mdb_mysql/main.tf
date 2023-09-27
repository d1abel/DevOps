terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

resource "yandex_mdb_mysql_cluster" "cluster" {
  environment = "PRESTABLE"
  name        = var.cluster_name
  network_id  = var.network_id
  version     = "8.0"

  dynamic "host" {
    for_each = var.HA ? [
      { zone = "ru-central1-a", subnet_id = var.subnet_a},
      { zone = "ru-central1-b", subnet_id = var.subnet_b},
      { zone = "ru-central1-c", subnet_id = var.subnet_c}
    ] : [
      { zone = "ru-central1-a", subnet_id = var.subnet_a}
    ]
    content {
      zone = host.value["zone"]
      subnet_id = host.value["subnet_id"]
    }
  }

  resources {
    disk_size          = 10
    disk_type_id       = "network-hdd"
    resource_preset_id = "s2.micro"
  }
}
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"

}

provider "yandex" {
  token = var.token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  zone = var.default_zone
}

resource "yandex_vpc_network" "network" {
  name = "develop"
}

resource "yandex_vpc_subnet" "subnet_a" {
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["10.0.0.0/24"]
  zone = "ru-central1-a"
}

#resource "yandex_vpc_subnet" "subnet_b" {
#  network_id     = yandex_vpc_network.network.id
#  v4_cidr_blocks = ["10.0.1.0/24"]
#  zone = "ru-central1-b"
#}
#
#resource "yandex_vpc_subnet" "subnet_c" {
#  network_id     = yandex_vpc_network.network.id
#  v4_cidr_blocks = ["10.0.2.0/24"]
#  zone = "ru-central1-c"
#}

module "mysql_cluster" {
  source = "mdb_mysql"
  cluster_name = "example"
  network_id = yandex_vpc_network.network.id
  HA = false
  subnet_a = yandex_vpc_subnet.subnet_a.id
#  subnet_b = yandex_vpc_subnet.subnet_b.id
#  subnet_c = yandex_vpc_subnet.subnet_c.id
}

module "mysql_db" {
  source = "mdb_mysql_db"
  cluster_id = module.mysql_cluster.cluster_id
  db_name = "test"
  db_user = "app"
}
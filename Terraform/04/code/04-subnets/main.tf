terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

module "vpc" {
  source = "vpc_multisubs"

  env_name = "production"
  net_name    = "prod"
  subnets     = [
    { zone = "ru-central1-a", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.4.0/24" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24" }
  ]
}
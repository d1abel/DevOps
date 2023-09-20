resource "yandex_compute_disk" "storage" {
  count = 3
  name = "storage-disk-${count.index}"
  size = 1
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage
    content {
      disk_id = secondary_disk.value.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
  }

  resources {
    cores  = 2
    memory = 4
  }

  scheduling_policy {
    preemptible = true
  }
}
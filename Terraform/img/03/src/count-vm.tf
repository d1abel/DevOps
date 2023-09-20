data "yandex_compute_image" "ubuntu-2004-lts" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "web" {
  count = 2
  name = "web-${format("%d", count.index + 1)}"
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
  }
  resources {
    cores  = 2
    memory = 2
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }

  scheduling_policy {
    preemptible = "true"
  }
}
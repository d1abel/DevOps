resource "yandex_compute_instance" "db" {
  depends_on = [yandex_compute_instance.web]

  for_each = {for key, value in var.params : key => value}
  name = each.value.vm_name

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      size = each.value.disk
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
  }
  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }

  scheduling_policy {
    preemptible = "true"
  }
}
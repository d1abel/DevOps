output "vm_external_ip_address" {
  value = {
    "netology-develop-platform-web" = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    "netology-develop-platform-db" = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
  }
  #yandex_compute_instance.platform.network_interface.0.nat_ip_address
  description = "vm external ip"
}
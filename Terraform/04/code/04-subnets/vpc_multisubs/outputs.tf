output "subnet_info" {
  value = [
    for subnet in yandex_vpc_subnet.vpc_subnet : { id = subnet.id }
  ]
}
resource "local_file" "hosts_cfg" {
  depends_on = [yandex_compute_instance.web, yandex_compute_instance.db, yandex_compute_instance.storage]
  content    = templatefile("${path.module}/hosts.tftpl", {
    webservers    = yandex_compute_instance.web
    databases     = yandex_compute_instance.db
    storageserver = yandex_compute_instance.storage
  }  )

  filename = "${abspath(path.module)}/hosts.cfg"
}

resource "null_resource" "provision" {
  depends_on = [yandex_compute_instance.storage, yandex_compute_instance.web, yandex_compute_instance.db]

  provisioner "local-exec" {
    command = "cat ~/.ssh/id_rsa | ssh-add -"
  }

  provisioner "local-exec" {
    command = "sleep 60"
  }

  provisioner "local-exec" {
    command     = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/hosts.cfg ${abspath(path.module)}/test.yml"
    on_failure  = continue
    environment = { ANSIBLE_HOST_KEY_CHECKING = false }
  }

  triggers = {
    always_run        = "${timestamp()}" #всегда т.к. дата и время постоянно изменяются
    playbook_src_hash = file("${abspath(path.module)}/test.yml") # при изменении содержимого playbook файла
    ssh_public_key    = local.ssh_key # при изменении переменной
  }
}
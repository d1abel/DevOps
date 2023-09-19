locals {
  vm_web_name = "${var.vm_web_platform.school}-${var.vm_web_platform.level}-${var.vm_web_platform.type}-${var.vm_web_platform.name}"
  vm_db_name = "${var.vm_db_platform.school}-${var.vm_db_platform.level}-${var.vm_db_platform.type}-${var.vm_db_platform.name}"
}
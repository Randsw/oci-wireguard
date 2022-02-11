output "wireguard-ip"{
    value = module.wireguar_instance.public_ip[0]
}

locals {
  inventory_rendered_content = templatefile("${path.module}/inventory_ansible.tftpl", 
  {
    wireguard_ip = "${module.wireguar_instance.public_ip[0]}"
  })
}

resource "local_file" "inventories" {
  content = local.inventory_rendered_content
  filename = "${path.module}/ansible/inventories/wireguard/hosts.yml"
}
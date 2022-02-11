compartment_name = "Wireguard"

vcn_name = "vcn"

vcn_dns_label = "wireguard"

vcn_cidrs = ["172.16.0.0/16"]

freeform_tags = {
                "app" = "wireguard"
                }

label_prefix = "wireguard"

internet_gateway_display_name = "internet-gateway"

security_list_name = "security-list"

subnet_display_name= "subnet"

subnet_dns_label = "cluster"

wireguard_instance_display_name = "server"

ssh_public_keys_path = "~/.ssh/wireguard-oci.pub"
resource "oci_core_security_list" "wireguard_security_list" {
    compartment_id = data.oci_identity_compartments.wireguard_compartments.compartments[0].id
    vcn_id = module.vcn.vcn_id 
    display_name = "${var.label_prefix}-${var.security_list_name}"
    freeform_tags = var.freeform_tags

    ingress_security_rules {
        protocol      = "17"
        source        = "0.0.0.0/0"
        description   = "Allow wireguard UDP connection"
        udp_options {
            min = "51820"
            max = "51820"
        }
     }
    ingress_security_rules {
        protocol    = "1"
        source      = "0.0.0.0/0"
        description = "ICMP traffic for: 3, 4 Destination Unreachable: Fragmentation Needed and Don't Fragment was Set"
        icmp_options {
            code = 4
            type = 3
            }
        }
    ingress_security_rules {
        protocol    = "6"
        source      = "0.0.0.0/0"
        description = "Allow ssh connection"
        tcp_options {
            max = 22
            min = 22
            }
        }
    egress_security_rules {
        protocol      = "6"
        destination   = "0.0.0.0/0"
        description   = "Allow output tcp connection"
     }
    egress_security_rules {
        protocol      = "17"
        destination   = "0.0.0.0/0"
        description   = "Allow output udp connection in subnet"
     }
}

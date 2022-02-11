module "wireguar_instance" {
  source = "oracle-terraform-modules/compute-instance/oci" 
  version                     = "2.4.0-RC1"
  instance_count              = 1 # how many instances do you want?
  ad_number                   = 3 # AD number to provision instances. If null, instances are provisionned in a rolling manner starting with AD1
  compartment_ocid            = data.oci_identity_compartments.wireguard_compartments.compartments[0].id
  freeform_tags               = var.freeform_tags
  instance_display_name       = "${var.label_prefix}-${var.wireguard_instance_display_name}"
  source_ocid                 = "${var.image_id[var.region]}"
  subnet_ocids                = [oci_core_subnet.wireguard-subnet.id]
  public_ip                   = var.public_ip # NONE, RESERVED or EPHEMERAL
  ssh_public_keys             = "${file(var.ssh_public_keys_path)}"
  shape                       = var.instance_shape
  assign_public_ip            = var.assign_public_ip
}
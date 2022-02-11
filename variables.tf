variable "compartment_name" {
    type = string
    description = "Name of existing compartment we want to use"
}

variable "compartment_state" {
    type = string  
    default = "ACTIVE"
    description = "State of existing compartment we want to use"
}

variable "vcn_name" {
    type = string
    description = "VCN name"
}

variable "vcn_dns_label" {
    type = string
    description = "VCN dns label"
}

variable "vcn_cidrs" {
    type = list(string)
    description = "List of VCN CIDRs"
    default = [ "172.16.0.0/16" ]
}

variable "freeform_tags" {
    type = map(string)
    description = "Free from tags"
}

variable "label_prefix" {
    type = string
    description = "A string to be prepended to the name of resources"
}

variable "internet_gateway_display_name" {
    type = string
    description = "Internet Gateway display name"
}

variable "security_list_name" {
    type = string
    description = "Subnet security list name"
}

variable wireguard_subnet_cidr {
    type = string
    description = "Wireguard Cluster subnet CIDR"
    default = "172.16.10.0/24"
}

variable "subnet_display_name" {
    type = string
    description = "Wireguard display name"
}

variable "subnet_dns_label" {
    type = string
    description = "Subnet DNS label"
}

variable "wireguard_instance_display_name" {
    type = string
    description = "Wireguard instance name"
}

variable "instance_shape" {
    type = string
    description = "Instance shape"
    default = "VM.Standard.E2.1.Micro"
}

variable "region" {
  default = "eu-frankfurt-1" 
  description = "Tenancy region"
}

variable "image_id" {
  type = map(string)
  description = "OS Image ID"
  default = {
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaipbulmzkf3yhsbbm4whkukmzdtc23jny3cbnognysmwy6a7dsraa" # Ubuntu 20.04 minimal
    # ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaalepl4teucgdomo6jbzgskc4r6fhrz7tp5twfosnqp47lk5v6qoa # Ubuntu 20.04
  }
}

variable "ssh_public_keys_path" {
    type = string
    description = "Path to ssh public key"
}

variable "public_ip" {
    type = string
    description = "Instance public ip state"
    default = "NONE"
    #default = "EPHEMERAL"
}

variable "assign_public_ip" {
    type = string
    default = true
}
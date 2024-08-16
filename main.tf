terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.68.1"
    }
  }
}

variable "vsi_dc" {
  description = "DC for the VSI"
  type        = string
  default     = "dal13"
}

variable "vsi_hostname" {
  description = "Hostname for the VSI"
  type        = string
}

resource "ibm_compute_vm_instance" "created_vsi_sangeles_da" {
  hostname             = var.vsi_hostname
  domain               = "softlayer.local"
  os_reference_code    = "UBUNTU_LATEST_64"
  datacenter           = var.vsi_dc
  network_speed        = 1000
  hourly_billing       = true
  local_disk           = false
  private_network_only = false
  flavor_key_name      = "B1_2X8X100"
  ipv6_enabled         = true
}
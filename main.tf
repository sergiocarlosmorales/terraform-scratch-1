terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.68.1"
    }
  }
}

variable "bm_dc" {
  description = "DC for the Bare Metal"
  type        = string
  default     = "dal13"
}
variable "bm_hostname" {
  description = "Hostname for the Bare Metal"
  type        = string
}
variable "bm_ram" {
  description = "How much RAM to assign"
  type        = number
}
variable "bm_cpu_keyname" {
  description = "Product keyName for the CPU (e.g., INTEL_INTEL_XEON_5218_2_30)"
  type        = string
}
variable "bm_uplink_speed" {
  description = "Uplink speed in Mbits (e.g. 1000 for 1Gbps)"
  type        = number
}

resource "ibm_compute_bare_metal" "created_bare_metal" {
  hostname         = var.bm_hostname
  domain           = "softlayer.local"
  datacenter       = var.bm_dc
  package_key_name = "DUAL_INTEL_XEON_PROC_CASCADE_LAKE_SCALABLE_FAMILY_12_DRIVES"
  process_key_name = var.bm_cpu_keyname
  memory           = var.bm_ram
  os_key_name      = "OS_CENTOS_STREAM_9_X_64_BIT"
  network_speed    = var.bm_uplink_speed
  public_bandwidth = 5000
  disk_key_names   = ["HARD_DRIVE_3_8TB_SSD_3DWPD", "HARD_DRIVE_3_8TB_SSD_3DWPD", "HARD_DRIVE_3_8TB_SSD_3DWPD"]
  hourly_billing   = false
  storage_groups {
    array_type_id = 2
    hard_drives = [0, 1]
    array_size  = 3800
    partition_template_id = 1144
  }
}
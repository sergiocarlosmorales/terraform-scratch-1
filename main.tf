terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.68.1"
    }
  }
}

resource ibm_compute_bare_metal "classic_bm_6764827786fdf" {
  hourly_billing = false
  hostname = "host0"
  domain = "sl0.local"
  os_key_name = "OS_CENTOS_STREAM_9_X_64_BIT"
  datacenter = "dal14"
  package_key_name = "DUAL_INTEL_XEON_PROC_CASCADE_LAKE_SCALABLE_FAMILY_12_DRIVES"
  process_key_name = "INTEL_INTEL_XEON_4210_2_20"
  memory = 128
  network_speed = 1000
  public_bandwidth = 5000
  private_network_only = false
  unbonded_network = false
  disk_key_names = [
    "HARD_DRIVE_2_00_TB_SATA_2",
    "HARD_DRIVE_2_00_TB_SATA_2",
    "HARD_DRIVE_960GB_SSD",
    "HARD_DRIVE_960GB_SSD",
    "HARD_DRIVE_960GB_SSD",
    "HARD_DRIVE_960GB_SSD"
  ]
  storage_groups {
    array_type_id = 1
    hard_drives = [
      0,
      1
    ]
    array_size = 4000
    partition_template_id = 1144
  }
  storage_groups {
    array_type_id = 5
    hard_drives = [
      2,
      3,
      4,
      5
    ]
    array_size = 1920
  }
}

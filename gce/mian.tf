# 1. Create a dedicated Service Account for the VMs
resource "google_service_account" "vm_sa" {
  account_id   = "gce-default-sa"
  display_name = "Custom SA for GCE Instances"
  project      = var.project_id
}

# 2. Create the VM instances
resource "google_compute_instance" "vm" {
  for_each     = var.instances
  name         = each.key
  machine_type = each.value.machine_type
  zone         = each.value.zone
  project      = var.project_id

  tags = each.value.tags

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    dynamic "access_config" {
      for_each = var.enable_public_ip ? [1] : [0]

      content {
        network_tier = "STANDARD"
      }
    }
  }

  service_account {
    email  = google_service_account.vm_sa.email
    scopes = ["cloud-platform"]
  }

  # Good practice: allow stopping for resize/update
  allow_stopping_for_update = true

  # --- VALIDATION LOGIC ---
  # This block ensures that at least one of network or subnetwork is set.
  lifecycle {
    precondition {
      condition     = var.network != "" || var.subnetwork != ""
      error_message = "You must specify either a 'network' or a 'subnetwork'. Both cannot be empty."
    }
  }
}

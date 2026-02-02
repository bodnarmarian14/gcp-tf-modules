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
    subnetwork = var.subnetwork
    # Add access_config {} here if you want a Public IP
  }

  service_account {
    email  = google_service_account.vm_sa.email
    scopes = ["cloud-platform"]
  }

  # Good practice: allow stopping for resize/update
  allow_stopping_for_update = true
}

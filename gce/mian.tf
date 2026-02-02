# 1. The VPC
resource "google_compute_network" "vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
  project                 = var.project_id
}

# 2. Dynamic Subnets
resource "google_compute_subnetwork" "subnets" {
  for_each      = { for s in var.subnets : s.name => s }
  name          = each.value.name
  ip_cidr_range = each.value.cidr
  region        = each.value.region
  network       = google_compute_network.vpc.id
}

# 3. Dynamic Firewall Rules
resource "google_compute_firewall" "rules" {
  for_each = { for r in var.firewall_rules : r.name => r }
  name     = each.value.name
  network  = google_compute_network.vpc.name

  dynamic "allow" {
    for_each = lookup(each.value, "allow", [])
    content {
      protocol = allow.value.protocol
      ports    = lookup(allow.value, "ports", null)
    }
  }

  source_ranges = lookup(each.value, "source_ranges", null)
  target_tags   = lookup(each.value, "target_tags", null)
}
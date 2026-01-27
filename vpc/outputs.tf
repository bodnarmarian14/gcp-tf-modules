output "network_name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc_network.name
}

output "network_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc_network.id
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = google_compute_subnetwork.subnet.name
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = google_compute_subnetwork.subnet.id
}

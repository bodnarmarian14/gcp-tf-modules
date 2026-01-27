output "load_balancer_ip" {
  description = "The global IP address of the load balancer. Point your DNS A-record here."
  value       = google_compute_global_address.default.address
}

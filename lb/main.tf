# 1. Reserve a Global Static IP Address
resource "google_compute_global_address" "default" {
  name    = "${var.name}-ip"
  project = var.project_id
}

# 2. Create a Google-managed SSL Certificate
resource "google_compute_managed_ssl_certificate" "default" {
  name    = "${var.name}-cert"
  project = var.project_id

  managed {
    domains = [var.domain_name]
  }
}

# 3. Define the Backend Bucket (The link to your GCS Bucket)
resource "google_compute_backend_bucket" "default" {
  name        = "${var.name}-backend"
  bucket_name = var.bucket_name
  enable_cdn  = var.enable_cdn
  project     = var.project_id
}

# 4. URL Map (Routing rules - sends everything to the bucket)
resource "google_compute_url_map" "default" {
  name            = "${var.name}-url-map"
  default_service = google_compute_backend_bucket.default.id
  project         = var.project_id
}

# 5. Target HTTPS Proxy (Attaches the SSL Cert to the URL Map)
resource "google_compute_target_https_proxy" "default" {
  name             = "${var.name}-https-proxy"
  url_map          = google_compute_url_map.default.id
  ssl_certificates = [google_compute_managed_ssl_certificate.default.id]
  project          = var.project_id
}

# 6. Global Forwarding Rule (The entry point: IP + 443 -> Proxy)
resource "google_compute_global_forwarding_rule" "default" {
  name       = "${var.name}-forwarding-rule"
  target     = google_compute_target_https_proxy.default.id
  port_range = "443"
  ip_address = google_compute_global_address.default.address
  project    = var.project_id
}

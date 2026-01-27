variable "project_id" {
  description = "The GCP Project ID."
  type        = string
}

variable "name" {
  description = "Base name for the load balancer resources (e.g., 'my-website')."
  type        = string
}

variable "bucket_name" {
  description = "The name of the GCS bucket acting as the backend."
  type        = string
}

variable "domain_name" {
  description = "The domain name for the SSL certificate (e.g., 'example.com')."
  type        = string
}

variable "enable_cdn" {
  description = "Enable Cloud CDN for caching content close to users."
  type        = bool
  default     = true
}

output "bucket_name" {
  description = "The name of the bucket."
  value       = google_storage_bucket.gcs.name
}

output "bucket_url" {
  description = "The base URL of the bucket, in the format gs://<bucket-name>."
  value       = google_storage_bucket.gcs.url
}

output "bucket_self_link" {
  description = "The URI of the created resource."
  value       = google_storage_bucket.gcs.self_link
}

output "website_url" {
  description = "The URL of the static website (if enabled)."
  value       = var.enable_website ? "http://${google_storage_bucket.gcs.name}.storage.googleapis.com" : null
}

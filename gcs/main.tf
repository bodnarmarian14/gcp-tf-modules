resource "google_storage_bucket" "gcs" {
  name          = var.name
  location      = var.location
  force_destroy = var.force_destroy

  uniform_bucket_level_access = var.enable_website ? true : var.uniform_bucket_level_access

  dynamic "website" {
    for_each = var.enable_website ? [1] : []
    content {
      main_page_suffix = var.main_page_suffix
      not_found_page   = var.not_found_page
    }
  }

  dynamic "cors" {
    for_each = var.cors_rules
    content {
      origin          = cors.value["origins"]
      method          = cors.value["methods"]
      response_header = cors.value["response_headers"]
      max_age_seconds = cors.value["max_age_seconds"]
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type          = lifecycle_rule.value.action.type
        storage_class = lifecycle_rule.value.action.storage_class
      }
      condition {
        age                   = lifecycle_rule.value.condition.age
        created_before        = lifecycle_rule.value.condition.created_before
        with_state            = lifecycle_rule.value.condition.with_state
        matches_storage_class = lifecycle_rule.value.condition.matches_storage_class
        num_newer_versions    = lifecycle_rule.value.condition.num_newer_versions
      }
    }
  }

  versioning {
    enabled = var.versioning
  }
}

# If enabled_webiste is true is recommended to use uniform level access for such buckets
resource "google_storage_bucket_acl" "image-store-acl" {
  count       = (!var.enable_website && !var.uniform_bucket_level_access) ? 1 : 0
  bucket      = google_storage_bucket.gcs.name
  role_entity = var.role_entity
}

resource "google_storage_bucket_object" "object" {
  for_each = var.bucket_objects

  name         = each.value.name
  content_type = each.value.content_type
  bucket       = google_storage_bucket.gcs.name
  source       = each.value.source
}

resource "google_storage_bucket_iam_member" "rule" {
  for_each = var.iam_rule

  role   = each.value.role
  member = each.value.member
  bucket = google_storage_bucket.gcs.name
}

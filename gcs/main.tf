resource "google_storage_bucket" "gce" {
  name          = var.name
  location      = var.location
  force_destroy = var.force_destroy

  uniform_bucket_level_access = true 

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

resource "google_storage_bucket_acl" "image-store-acl" {
  count       = var.enable_gce_acl ? 1 : 0
  bucket      = google_storage_bucket.gce.name
  role_entity = var.role_entity
}
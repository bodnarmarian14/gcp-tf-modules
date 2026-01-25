variable "name" {
  type        = string
  description = "Name of the GCS bucket."
}

variable "location" {
  type        = string
  default     = "EU"
  description = "Location of the bucket (e.g., US, EU, europe-central2)."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "When true, allows Terraform to delete the bucket even if it contains objects."
}

variable "enable_website" {
  type        = bool
  default     = false
  description = "Set to true to configure the bucket as a static website."
}

variable "main_page_suffix" {
  type        = string
  default     = "index.html"
  description = "The main page (index) for the static website."
}

variable "not_found_page" {
  type        = string
  default     = "404.html"
  description = "The 404 error page for the static website."
}

variable "cors_rules" {
  type = list(object({
    origins          = list(string)
    methods          = list(string)
    response_headers = list(string)
    max_age_seconds  = number
  }))
  default     = []
  description = "List of CORS configurations."
}

variable "lifecycle_rules" {
  description = "List of lifecycle rules to configure."
  default     = []
  type = list(object({
    action = object({
      type          = string
      storage_class = optional(string, null)
    })
    condition = object({
      age                   = optional(number, null)
      created_before        = optional(string, null)
      with_state            = optional(string, null)
      matches_storage_class = optional(list(string), [])
      num_newer_versions    = optional(number, null)
    })
  }))
}

variable "versioning" {
  type        = bool
  default     = false
  description = "Enable or disable versioning for the bucket."
}

variable "uniform_bucket_level_access" {
  type        = bool
  default     = false
  description = "Enable legacy ACLs for the bucket."
}

variable "role_entity" {
  type        = list(string)
  default     = []
  description = "List of role/entity pairs for the ACL (e.g. ['OWNER:user-my-user'])."
}

variable "bucket_objects" {
  description = "A map of objects to upload to the GCS bucket."
  type = map(object({
    name         = string
    content_type = string
  }))
  default = {}
}

variable "iam_rule" {
  description = "A map of IAM roles and members to apply to the bucket."
  type = map(object({
    role   = string
    member = string
  }))
  default = {}
}

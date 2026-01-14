# Google Cloud Storage Bucket Module

This Terraform module creates a Google Cloud Storage bucket with optional support for:
- Static Website hosting
- CORS (Cross-Origin Resource Sharing)
- Lifecycle Rules (Auto-delete, Auto-archive)
- Versioning
- Access Control Lists (ACLs)

## Usage

### Simple Bucket
```hcl
module "simple_bucket" {
  source   = "https://github.com/bodnarmarian14/gcp-tf-modules/gcs"
  name     = "my-simple-bucket-123"
  location = "EU"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.gcs](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_acl.image-store-acl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_acl) | resource |
| [google_storage_bucket_iam_member.rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_object.object](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_objects"></a> [bucket\_objects](#input\_bucket\_objects) | A map of objects to upload to the GCS bucket. | <pre>map(object({<br/>    name         = string<br/>    content_type = string<br/>    source       = string<br/>  }))</pre> | `{}` | no |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | List of CORS configurations. | <pre>list(object({<br/>    origins          = list(string)<br/>    methods          = list(string)<br/>    response_headers = list(string)<br/>    max_age_seconds  = number<br/>  }))</pre> | `[]` | no |
| <a name="input_enable_website"></a> [enable\_website](#input\_enable\_website) | Set to true to configure the bucket as a static website. | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | When true, allows Terraform to delete the bucket even if it contains objects. | `bool` | `false` | no |
| <a name="input_iam_rule"></a> [iam\_rule](#input\_iam\_rule) | A map of IAM roles and members to apply to the bucket. | <pre>map(object({<br/>    role   = string<br/>    member = string<br/>  }))</pre> | `{}` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | List of lifecycle rules to configure. | <pre>list(object({<br/>    action = object({<br/>      type          = string<br/>      storage_class = optional(string, null)<br/>    })<br/>    condition = object({<br/>      age                   = optional(number, null)<br/>      created_before        = optional(string, null)<br/>      with_state            = optional(string, null)<br/>      matches_storage_class = optional(list(string), [])<br/>      num_newer_versions    = optional(number, null)<br/>    })<br/>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the bucket (e.g., US, EU, europe-central2). | `string` | `"EU"` | no |
| <a name="input_main_page_suffix"></a> [main\_page\_suffix](#input\_main\_page\_suffix) | The main page (index) for the static website. | `string` | `"index.html"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the GCS bucket. | `string` | n/a | yes |
| <a name="input_not_found_page"></a> [not\_found\_page](#input\_not\_found\_page) | The 404 error page for the static website. | `string` | `"404.html"` | no |
| <a name="input_role_entity"></a> [role\_entity](#input\_role\_entity) | List of role/entity pairs for the ACL (e.g. ['OWNER:user-my-user']). | `list(string)` | `[]` | no |
| <a name="input_uniform_bucket_level_access"></a> [uniform\_bucket\_level\_access](#input\_uniform\_bucket\_level\_access) | Enable legacy ACLs for the bucket. | `bool` | `false` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Enable or disable versioning for the bucket. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The name of the bucket. |
| <a name="output_bucket_self_link"></a> [bucket\_self\_link](#output\_bucket\_self\_link) | The URI of the created resource. |
| <a name="output_bucket_url"></a> [bucket\_url](#output\_bucket\_url) | The base URL of the bucket, in the format gs://<bucket-name>. |
| <a name="output_website_url"></a> [website\_url](#output\_website\_url) | The URL of the static website (if enabled). |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

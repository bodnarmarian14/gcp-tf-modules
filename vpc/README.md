<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow_internal](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the VPC network | `string` | `"my-custom-vpc"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the GCP project where resources will be created | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The GCP region for the subnetwork | `string` | `"us-central1"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | The IP CIDR range for the subnetwork | `string` | `"10.0.0.0/24"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnetwork | `string` | `"my-subnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | The ID of the VPC |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | The name of the VPC |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the subnet |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | The name of the subnet |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

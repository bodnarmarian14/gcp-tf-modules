variable "project_id" {
  description = "The ID of the GCP project where resources will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "my-custom-vpc"
}

variable "region" {
  description = "The GCP region for the subnetwork"
  type        = string
  default     = "us-central1"
}

variable "subnet_name" {
  description = "The name of the subnetwork"
  type        = string
  default     = "my-subnet"
}

variable "subnet_cidr" {
  description = "The IP CIDR range for the subnetwork"
  type        = string
  default     = "10.0.0.0/24"
}

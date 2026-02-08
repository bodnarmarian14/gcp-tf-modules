variable "project_id" { type = string }
#variable "region" { type = string }
variable "subnetwork" { type = string }

variable "network" {
  type = string
}

variable "enable_public_ip" {
  description = "Assinge public IP address to instance if set to true."
  type        = bool
  default     = false
}

variable "instances" {
  description = "Map of instances to create"
  type = map(object({
    machine_type = string
    zone         = string
    image        = string
    tags         = list(string)
  }))
}

variable "network" {
  description = "The name or self_link of the network."
  type        = string
  default     = null
}

variable "subnetwork" {
  description = "The name or self_link of the subnetwork."
  type        = string
  default     = null
}
variable "network" {
  description = "VPC network name or self-link for the instance."
  type        = string
}

variable "enable_public_ip" {
  description = "Assign a public IP to the instance when true."
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

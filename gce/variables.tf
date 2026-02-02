variable "project_id" { type = string }
#variable "region" { type = string }
variable "subnetwork" { type = string }

variable "instances" {
  description = "Map of instances to create"
  type = map(object({
    machine_type = string
    zone         = string
    image        = string
    tags         = list(string)
  }))
}

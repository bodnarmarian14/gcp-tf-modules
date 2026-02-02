variable "project_id" { type = string }
variable "network_name" { type = string }

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name   = string
    region = string
    cidr   = string
  }))
  default = []
}

variable "firewall_rules" {
  description = "Dynamic list of firewall rules"
  type = any
  default = []
}
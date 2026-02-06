variable "project_id" {
  default     = "default"
  type        = string
  description = "Sets the project where the SA/SAs will be dployed."
}

variable "service_accounts" {
  type = list(object({
    account_id   = string
    display_name = string
  }))
  default     = []
  description = "List of sercice accounts."
}

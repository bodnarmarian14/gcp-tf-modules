variable "project_id" {
  type        = string
  description = "Sets the project where the SA/SAs will be deployed."
}

variable "service_accounts" {
  type = list(object({
    account_id   = string
    display_name = string
  }))
  default     = []
  description = "List of service accounts."
}

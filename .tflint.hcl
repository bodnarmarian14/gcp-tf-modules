# Disables the requirement for `required_version`
rule "terraform_required_version" {
  enabled = false
}

# Disables the requirement for provider version constraints
rule "terraform_required_providers" {
  enabled = false
}

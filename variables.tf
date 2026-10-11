variable "notifications_integrations" {
  description = <<EOT
Map of notifications_integrations, attributes below
Required:
    - display_name
Optional:
    - description
    - ms_teams_target (block):
        - webhook_url (required)
    - slack_target (block):
        - webhook_url (required)
    - webhook_target (block):
        - url (required)
EOT

  type = map(object({
    display_name = string
    description  = optional(string)
    ms_teams_target = optional(object({
      webhook_url = string
    }))
    slack_target = optional(object({
      webhook_url = string
    }))
    webhook_target = optional(object({
      url = string
    }))
  }))
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


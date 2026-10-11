resource "confluent_notifications_integration" "notifications_integrations" {
  for_each = var.notifications_integrations

  display_name = each.value.display_name
  description  = each.value.description

  dynamic "ms_teams_target" {
    for_each = each.value.ms_teams_target != null ? [each.value.ms_teams_target] : []
    content {
      webhook_url = ms_teams_target.value.webhook_url
    }
  }

  dynamic "slack_target" {
    for_each = each.value.slack_target != null ? [each.value.slack_target] : []
    content {
      webhook_url = slack_target.value.webhook_url
    }
  }

  dynamic "webhook_target" {
    for_each = each.value.webhook_target != null ? [each.value.webhook_target] : []
    content {
      url = webhook_target.value.url
    }
  }
}


resource "pagerduty_service" "services" {
  for_each = var.services

  escalation_policy       = each.value.escalation_policy
  name                    = each.value.name
  acknowledgement_timeout = each.value.acknowledgement_timeout
  alert_creation          = each.value.alert_creation
  alert_grouping          = each.value.alert_grouping
  alert_grouping_timeout  = each.value.alert_grouping_timeout
  auto_resolve_timeout    = each.value.auto_resolve_timeout
  description             = each.value.description
  response_play           = each.value.response_play

  dynamic "alert_grouping_parameters" {
    for_each = each.value.alert_grouping_parameters != null ? [each.value.alert_grouping_parameters] : []
    content {
      dynamic "config" {
        for_each = alert_grouping_parameters.value.config != null ? [alert_grouping_parameters.value.config] : []
        content {
          aggregate   = config.value.aggregate
          fields      = config.value.fields
          time_window = config.value.time_window
          timeout     = config.value.timeout
        }
      }
      type = alert_grouping_parameters.value.type
    }
  }

  dynamic "auto_pause_notifications_parameters" {
    for_each = each.value.auto_pause_notifications_parameters != null ? [each.value.auto_pause_notifications_parameters] : []
    content {
      enabled = auto_pause_notifications_parameters.value.enabled
      timeout = auto_pause_notifications_parameters.value.timeout
    }
  }

  dynamic "incident_urgency_rule" {
    for_each = each.value.incident_urgency_rule != null ? [each.value.incident_urgency_rule] : []
    content {
      dynamic "during_support_hours" {
        for_each = incident_urgency_rule.value.during_support_hours != null ? [incident_urgency_rule.value.during_support_hours] : []
        content {
          type    = during_support_hours.value.type
          urgency = during_support_hours.value.urgency
        }
      }
      dynamic "outside_support_hours" {
        for_each = incident_urgency_rule.value.outside_support_hours != null ? [incident_urgency_rule.value.outside_support_hours] : []
        content {
          type    = outside_support_hours.value.type
          urgency = outside_support_hours.value.urgency
        }
      }
      type    = incident_urgency_rule.value.type
      urgency = incident_urgency_rule.value.urgency
    }
  }

  dynamic "scheduled_actions" {
    for_each = each.value.scheduled_actions != null ? each.value.scheduled_actions : []
    content {
      dynamic "at" {
        for_each = scheduled_actions.value.at != null ? scheduled_actions.value.at : []
        content {
          name = at.value.name
          type = at.value.type
        }
      }
      to_urgency = scheduled_actions.value.to_urgency
      type       = scheduled_actions.value.type
    }
  }

  dynamic "support_hours" {
    for_each = each.value.support_hours != null ? [each.value.support_hours] : []
    content {
      days_of_week = support_hours.value.days_of_week
      end_time     = support_hours.value.end_time
      start_time   = support_hours.value.start_time
      time_zone    = support_hours.value.time_zone
      type         = support_hours.value.type
    }
  }
}


output "services_id" {
  description = "Map of id values across all services, keyed the same as var.services except keys with no id are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.id if v.id != null && length(v.id) > 0 }
}
output "services_acknowledgement_timeout" {
  description = "Map of acknowledgement_timeout values across all services, keyed the same as var.services except keys with no acknowledgement_timeout are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.acknowledgement_timeout if v.acknowledgement_timeout != null && length(v.acknowledgement_timeout) > 0 }
}
output "services_alert_creation" {
  description = "Map of alert_creation values across all services, keyed the same as var.services except keys with no alert_creation are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.alert_creation if v.alert_creation != null && length(v.alert_creation) > 0 }
}
output "services_alert_grouping" {
  description = "Map of alert_grouping values across all services, keyed the same as var.services except keys with no alert_grouping are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.alert_grouping if v.alert_grouping != null && length(v.alert_grouping) > 0 }
}
output "services_alert_grouping_parameters" {
  description = "Map of alert_grouping_parameters values across all services, keyed the same as var.services except keys with no alert_grouping_parameters are omitted"
  value       = { for k, v in pagerduty_service.services : k => one(v.alert_grouping_parameters) if v.alert_grouping_parameters != null && length(v.alert_grouping_parameters) > 0 }
}
output "services_alert_grouping_timeout" {
  description = "Map of alert_grouping_timeout values across all services, keyed the same as var.services except keys with no alert_grouping_timeout are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.alert_grouping_timeout if v.alert_grouping_timeout != null && length(v.alert_grouping_timeout) > 0 }
}
output "services_auto_pause_notifications_parameters" {
  description = "Map of auto_pause_notifications_parameters values across all services, keyed the same as var.services except keys with no auto_pause_notifications_parameters are omitted"
  value       = { for k, v in pagerduty_service.services : k => one(v.auto_pause_notifications_parameters) if v.auto_pause_notifications_parameters != null && length(v.auto_pause_notifications_parameters) > 0 }
}
output "services_auto_resolve_timeout" {
  description = "Map of auto_resolve_timeout values across all services, keyed the same as var.services except keys with no auto_resolve_timeout are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.auto_resolve_timeout if v.auto_resolve_timeout != null && length(v.auto_resolve_timeout) > 0 }
}
output "services_created_at" {
  description = "Map of created_at values across all services, keyed the same as var.services except keys with no created_at are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.created_at if v.created_at != null && length(v.created_at) > 0 }
}
output "services_description" {
  description = "Map of description values across all services, keyed the same as var.services except keys with no description are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.description if v.description != null && length(v.description) > 0 }
}
output "services_escalation_policy" {
  description = "Map of escalation_policy values across all services, keyed the same as var.services except keys with no escalation_policy are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.escalation_policy if v.escalation_policy != null && length(v.escalation_policy) > 0 }
}
output "services_html_url" {
  description = "Map of html_url values across all services, keyed the same as var.services except keys with no html_url are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.html_url if v.html_url != null && length(v.html_url) > 0 }
}
output "services_incident_urgency_rule" {
  description = "Map of incident_urgency_rule values across all services, keyed the same as var.services except keys with no incident_urgency_rule are omitted"
  value       = { for k, v in pagerduty_service.services : k => one(v.incident_urgency_rule) if v.incident_urgency_rule != null && length(v.incident_urgency_rule) > 0 }
}
output "services_last_incident_timestamp" {
  description = "Map of last_incident_timestamp values across all services, keyed the same as var.services except keys with no last_incident_timestamp are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.last_incident_timestamp if v.last_incident_timestamp != null && length(v.last_incident_timestamp) > 0 }
}
output "services_name" {
  description = "Map of name values across all services, keyed the same as var.services except keys with no name are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.name if v.name != null && length(v.name) > 0 }
}
output "services_response_play" {
  description = "Map of response_play values across all services, keyed the same as var.services except keys with no response_play are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.response_play if v.response_play != null && length(v.response_play) > 0 }
}
output "services_scheduled_actions" {
  description = "Map of scheduled_actions values across all services, keyed the same as var.services except keys with no scheduled_actions are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.scheduled_actions if v.scheduled_actions != null && length(v.scheduled_actions) > 0 }
}
output "services_status" {
  description = "Map of status values across all services, keyed the same as var.services except keys with no status are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.status if v.status != null && length(v.status) > 0 }
}
output "services_support_hours" {
  description = "Map of support_hours values across all services, keyed the same as var.services except keys with no support_hours are omitted"
  value       = { for k, v in pagerduty_service.services : k => one(v.support_hours) if v.support_hours != null && length(v.support_hours) > 0 }
}
output "services_type" {
  description = "Map of type values across all services, keyed the same as var.services except keys with no type are omitted"
  value       = { for k, v in pagerduty_service.services : k => v.type if v.type != null && length(v.type) > 0 }
}


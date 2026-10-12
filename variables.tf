variable "services" {
  description = <<EOT
Map of services, attributes below
Required:
    - escalation_policy
    - name
Optional:
    - acknowledgement_timeout
    - alert_creation
    - alert_grouping
    - alert_grouping_timeout
    - auto_resolve_timeout
    - description
    - response_play
    - alert_grouping_parameters (block):
        - config (optional, block):
            - aggregate (optional)
            - fields (optional)
            - time_window (optional)
            - timeout (optional)
        - type (optional)
    - auto_pause_notifications_parameters (block):
        - enabled (optional)
        - timeout (optional)
    - incident_urgency_rule (block):
        - during_support_hours (optional, block):
            - type (optional)
            - urgency (optional)
        - outside_support_hours (optional, block):
            - type (optional)
            - urgency (optional)
        - type (required)
        - urgency (optional)
    - scheduled_actions (block):
        - at (optional, block):
            - name (optional)
            - type (optional)
        - to_urgency (optional)
        - type (optional)
    - support_hours (block):
        - days_of_week (optional)
        - end_time (optional)
        - start_time (optional)
        - time_zone (optional)
        - type (optional)
EOT

  type = map(object({
    escalation_policy       = string
    name                    = string
    acknowledgement_timeout = optional(string)
    alert_creation          = optional(string)
    alert_grouping          = optional(string)
    alert_grouping_timeout  = optional(string)
    auto_resolve_timeout    = optional(string)
    description             = optional(string)
    response_play           = optional(string)
    alert_grouping_parameters = optional(object({
      config = optional(object({
        aggregate   = optional(string)
        fields      = optional(list(string))
        time_window = optional(number)
        timeout     = optional(number)
      }))
      type = optional(string)
    }))
    auto_pause_notifications_parameters = optional(object({
      enabled = optional(bool)
      timeout = optional(number)
    }))
    incident_urgency_rule = optional(object({
      during_support_hours = optional(object({
        type    = optional(string)
        urgency = optional(string)
      }))
      outside_support_hours = optional(object({
        type    = optional(string)
        urgency = optional(string)
      }))
      type    = string
      urgency = optional(string)
    }))
    scheduled_actions = optional(list(object({
      at = optional(list(object({
        name = optional(string)
        type = optional(string)
      })))
      to_urgency = optional(string)
      type       = optional(string)
    })))
    support_hours = optional(object({
      days_of_week = optional(list(number))
      end_time     = optional(string)
      start_time   = optional(string)
      time_zone    = optional(string)
      type         = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.services : (
        v.auto_pause_notifications_parameters == null || (v.auto_pause_notifications_parameters.timeout == null || (contains([120, 180, 300, 600, 900], v.auto_pause_notifications_parameters.timeout)))
      )
    ])
    error_message = "must be one of: 120, 180, 300, 600, 900"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


locals {
  custom_policy_attachments = [
    for policy_key, policy in volcenginecc_iam_policy.custom :
    {
      policy_name = policy.policy_name
      policy_type = "Custom"
    }
  ]

  managed_policy_attachments = [
    for policy in values(var.managed_policies) :
    {
      policy_name = policy.name
      policy_type = policy.type
    }
  ]
}

resource "volcenginecc_iam_policy" "custom" {
  for_each = var.custom_policies

  policy_name     = each.value.name
  policy_type     = "Custom"
  policy_document = each.value.document
  description     = each.value.description
}

resource "volcenginecc_iam_role" "this" {
  role_name              = var.role_name
  display_name           = var.display_name
  description            = var.description
  trust_policy_document  = var.trust_policy_document
  max_session_duration   = var.max_session_duration
  is_service_linked_role = var.is_service_linked_role ? 1 : 0
  service_name           = var.service_name

  policies = concat(
    local.custom_policy_attachments,
    local.managed_policy_attachments,
  )

  tags = [
    for key, value in var.tags : {
      key   = key
      value = value
    }
  ]

  lifecycle {
    precondition {
      condition = length(distinct([
        for policy in concat(
          local.custom_policy_attachments,
          local.managed_policy_attachments,
        ) : "${policy.policy_type}:${policy.policy_name}"
      ])) == length(local.custom_policy_attachments) + length(local.managed_policy_attachments)
      error_message = "A policy must not be declared in both custom_policies and managed_policies, or more than once in managed_policies."
    }

    precondition {
      condition = !var.is_service_linked_role ? true : (
        var.service_name != null && length(trimspace(var.service_name)) > 0
      )
      error_message = "service_name must be set for a service-linked role."
    }

    precondition {
      condition     = var.is_service_linked_role || var.service_name == null
      error_message = "service_name can only be set when is_service_linked_role is true."
    }
  }
}

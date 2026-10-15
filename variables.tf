variable "role_name" {
  type        = string
  description = "Name of the IAM role. The Provider accepts 1 to 64 letters, numbers, periods, hyphens, and underscores."

  validation {
    condition     = can(regex("^[A-Za-z0-9._-]{1,64}$", var.role_name))
    error_message = "role_name must contain 1 to 64 letters, numbers, periods, hyphens, or underscores."
  }
}

variable "display_name" {
  type        = string
  description = "Human-readable role display name. Provider returns this field as Optional+Computed."
  default     = null

  validation {
    condition     = var.display_name == null ? true : length(var.display_name) <= 64
    error_message = "display_name must not exceed 64 characters."
  }
}

variable "description" {
  type        = string
  description = "Role description. Provider returns this field as Optional+Computed."
  default     = null

  validation {
    condition     = var.description == null ? true : length(var.description) <= 128
    error_message = "description must not exceed 128 characters."
  }
}

variable "trust_policy_document" {
  type        = string
  description = "JSON trust policy that defines the principals allowed to assume this role."

  validation {
    condition     = can(jsondecode(var.trust_policy_document))
    error_message = "trust_policy_document must be valid JSON."
  }
}

variable "max_session_duration" {
  type        = number
  description = "Maximum STS session duration in seconds."
  default     = 43200

  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "max_session_duration must be between 3600 and 43200 seconds."
  }
}

variable "is_service_linked_role" {
  type        = bool
  description = "Whether this is a service-linked role. Service-linked roles require service_name."
  default     = false
}

variable "service_name" {
  type        = string
  description = "Service associated with a service-linked role. Leave null for ordinary service roles."
  default     = null
}

variable "custom_policies" {
  type = map(object({
    name        = string
    document    = string
    description = optional(string, null)
  }))
  description = "Custom IAM policies keyed by stable logical names. Their policy documents should grant only the actions and resources required by the workload."
  default     = {}

  validation {
    condition = alltrue([
      for policy in values(var.custom_policies) :
      can(regex("^[A-Za-z0-9+=,.@_-]{1,64}$", policy.name))
    ])
    error_message = "Each custom policy name must contain 1 to 64 supported IAM policy-name characters."
  }

  validation {
    condition     = alltrue([for policy in values(var.custom_policies) : can(jsondecode(policy.document))])
    error_message = "Each custom policy document must be valid JSON."
  }

  validation {
    condition     = alltrue([for policy in values(var.custom_policies) : policy.description == null ? true : length(policy.description) <= 128])
    error_message = "Each custom policy description must not exceed 128 characters."
  }
}

variable "managed_policies" {
  type = map(object({
    name = string
    type = optional(string, "System")
  }))
  description = "Existing IAM policies to attach to the managed role, keyed by stable logical names. This module never creates System policies."
  default     = {}

  validation {
    condition = alltrue([
      for policy in values(var.managed_policies) :
      contains(["System", "Custom"], policy.type)
    ])
    error_message = "Each managed policy type must be System or Custom."
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the IAM role."
  default     = {}

  validation {
    condition     = alltrue([for key in keys(var.tags) : length(trimspace(key)) > 0])
    error_message = "Tag keys must not be empty."
  }
}

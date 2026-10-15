output "role_id" {
  description = "Numeric ID of the managed IAM role."
  value       = volcenginecc_iam_role.this.role_id
}

output "role_name" {
  description = "Name of the managed IAM role."
  value       = volcenginecc_iam_role.this.role_name
}

output "role_trn" {
  description = "TRN of the managed IAM role."
  value       = volcenginecc_iam_role.this.trn
}

output "custom_policy_trns" {
  description = "TRNs of custom policies keyed by the same stable keys as custom_policies."
  value = {
    for key, policy in volcenginecc_iam_policy.custom :
    key => policy.policy_trn
  }
}

output "custom_policy_ids" {
  description = "Provider resource IDs of custom policies keyed by the same stable keys as custom_policies."
  value = {
    for key, policy in volcenginecc_iam_policy.custom :
    key => policy.id
  }
}

output "attached_policies" {
  description = "Policies declared as attached to the managed role."
  value = concat(
    [for policy in values(volcenginecc_iam_policy.custom) : {
      name = policy.policy_name
      type = "Custom"
    }],
    [for policy in values(var.managed_policies) : {
      name = policy.name
      type = policy.type
    }],
  )
}

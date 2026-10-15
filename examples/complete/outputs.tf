output "role_name" {
  description = "Created VKE CI/CD delivery role name."
  value       = module.delivery_service_role.role_name
}

output "role_trn" {
  description = "Created VKE CI/CD delivery role TRN."
  value       = module.delivery_service_role.role_trn
}

output "role_id" {
  description = "Created VKE CI/CD delivery role numeric ID."
  value       = module.delivery_service_role.role_id
}

output "custom_policy_trns" {
  description = "Created least-privilege custom policy TRNs."
  value       = module.delivery_service_role.custom_policy_trns
}

output "custom_policy_ids" {
  description = "Created least-privilege custom policy provider IDs."
  value       = module.delivery_service_role.custom_policy_ids
}

output "attached_policies" {
  description = "Policies attached to the VKE CI/CD delivery role."
  value       = module.delivery_service_role.attached_policies
}

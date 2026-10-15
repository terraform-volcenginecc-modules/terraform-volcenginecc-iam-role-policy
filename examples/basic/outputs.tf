output "role_name" {
  description = "Created ECS service role name."
  value       = module.ecs_service_role.role_name
}

output "role_trn" {
  description = "Created ECS service role TRN."
  value       = module.ecs_service_role.role_trn
}

output "role_id" {
  description = "Created ECS service role numeric ID."
  value       = module.ecs_service_role.role_id
}

output "custom_policy_ids" {
  description = "Created ECS custom policy provider IDs."
  value       = module.ecs_service_role.custom_policy_ids
}

output "attached_policies" {
  description = "Policies attached to the ECS service role."
  value       = module.ecs_service_role.attached_policies
}

variable "role_name" {
  type        = string
  description = "Name for the ECS service role."
  default     = "ecs-config-reader"
}

variable "configuration_object_trn" {
  type        = string
  description = "TRN of the single application configuration object the ECS workload may read."
}

variable "environment" {
  type        = string
  description = "Deployment environment tag."
  default     = "dev"
}

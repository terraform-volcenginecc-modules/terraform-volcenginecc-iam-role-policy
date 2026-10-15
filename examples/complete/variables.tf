variable "role_name" {
  type        = string
  description = "Name for the VKE CI/CD service role."
  default     = "vke-cicd-delivery"
}

variable "cicd_principal_trn" {
  type        = string
  description = "TRN of the CI/CD identity permitted to assume this role."
}

variable "external_id" {
  type        = string
  description = "External ID required when the CI/CD principal assumes the role."
  sensitive   = true
}

variable "vke_cluster_trn" {
  type        = string
  description = "TRN of the VKE cluster managed by this delivery role."
}

variable "artifact_resource_trns" {
  type        = list(string)
  description = "TRNs for the artifact bucket and allowed object prefix."
}

variable "logging_policy_name" {
  type        = string
  description = "Name of an existing system-managed logging policy to attach."
}

variable "environment" {
  type        = string
  description = "Deployment environment tag."
  default     = "prod"
}

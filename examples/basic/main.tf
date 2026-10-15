module "ecs_service_role" {
  source  = "terraform-volcenginecc-modules/iam-role-policy/volcenginecc"
  version = "~> 1.0"

  role_name    = var.role_name
  display_name = "ECS application read-only role"
  description  = "Role assumed by an ECS workload to read its application configuration."

  trust_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = ["ecs.volcengine.com"]
      }
      Action = ["sts:AssumeRole"]
    }]
  })

  custom_policies = {
    application_config_read = {
      name        = "${var.role_name}-config-read"
      description = "Read only the named application configuration objects."
      document = jsonencode({
        Version = "2012-10-17"
        Statement = [{
          Effect   = "Allow"
          Action   = ["tos:GetObject"]
          Resource = [var.configuration_object_trn]
        }]
      })
    }
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Scenario    = "ecs-service-role"
  }
}

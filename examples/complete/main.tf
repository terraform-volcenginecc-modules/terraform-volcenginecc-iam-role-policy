module "delivery_service_role" {
  source  = "terraform-volcenginecc-modules/iam-role-policy/volcenginecc"
  version = "~> 1.0"

  role_name    = var.role_name
  display_name = "VKE CI/CD delivery role"
  description  = "Role for a trusted CI/CD principal to deploy a named VKE workload."

  trust_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        IAM = [var.cicd_principal_trn]
      }
      Action = ["sts:AssumeRole"]
      Condition = {
        StringEquals = {
          "sts:ExternalId" = var.external_id
        }
      }
    }]
  })

  custom_policies = {
    vke_workload_deploy = {
      name        = "${var.role_name}-vke-deploy"
      description = "Deploy only the configured VKE workload namespace."
      document = jsonencode({
        Version = "2012-10-17"
        Statement = [{
          Effect = "Allow"
          Action = [
            "vke:DescribeCluster",
            "vke:DescribeAddon",
            "vke:UpdateAddon",
          ]
          Resource = [var.vke_cluster_trn]
        }]
      })
    }
    artifact_read = {
      name        = "${var.role_name}-artifact-read"
      description = "Read deployment artifacts from one TOS prefix."
      document = jsonencode({
        Version = "2012-10-17"
        Statement = [{
          Effect   = "Allow"
          Action   = ["tos:GetObject", "tos:ListBucket"]
          Resource = var.artifact_resource_trns
        }]
      })
    }
  }

  managed_policies = {
    logging = {
      name = var.logging_policy_name
      type = "System"
    }
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Scenario    = "vke-cicd-delivery"
  }
}

# COMPLETE IAM ROLE POLICY Example

## Overview

Runnable complete configuration for the IAM ROLE POLICY module. It configures the provider from input variables and calls the published Registry module.

## Usage

```shell
terraform init
terraform plan
terraform apply
terraform plan
terraform destroy
```

## Requirements

| Name | Version |
|---|---|
| Terraform | `>= 1.5.7` |
| OpenTofu | `>= 1.11.8` |

## Providers

| Name | Source |
|---|---|
| `volcenginecc` | `volcengine/volcenginecc` |

## Resources

| Name | Description |
|---|---|
| `terraform-volcenginecc-modules/iam-role-policy/volcenginecc` | Published IAM ROLE POLICY module. |

## Inputs

| Name | Description |
|---|---|
| `role_name` | Module-defined role_name. |
| `cicd_principal_trn` | Module-defined cicd_principal_trn. |
| `external_id` | Module-defined external_id. |
| `vke_cluster_trn` | Module-defined vke_cluster_trn. |
| `artifact_resource_trns` | Module-defined artifact_resource_trns. |
| `logging_policy_name` | Module-defined logging_policy_name. |
| `environment` | Module-defined environment. |

## Outputs

| Name | Description |
|---|---|
| `role_name` | Module-defined role_name. |
| `role_trn` | Module-defined role_trn. |
| `role_id` | Module-defined role_id. |
| `custom_policy_trns` | Module-defined custom_policy_trns. |
| `custom_policy_ids` | Module-defined custom_policy_ids. |
| `attached_policies` | Module-defined attached_policies. |

## Examples

This directory is the complete example.

## Notes

- Supply credentials through supported provider configuration, never in source files.
- The final plan after apply must report no changes before the configuration is accepted.

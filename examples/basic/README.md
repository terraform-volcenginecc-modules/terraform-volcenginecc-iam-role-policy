# BASIC IAM ROLE POLICY Example

## Overview

Runnable basic configuration for the IAM ROLE POLICY module. It configures the provider from input variables and calls the published Registry module.

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
| `configuration_object_trn` | Module-defined configuration_object_trn. |
| `environment` | Module-defined environment. |

## Outputs

| Name | Description |
|---|---|
| `role_name` | Module-defined role_name. |
| `role_trn` | Module-defined role_trn. |
| `role_id` | Module-defined role_id. |
| `custom_policy_ids` | Module-defined custom_policy_ids. |
| `attached_policies` | Module-defined attached_policies. |

## Examples

This directory is the basic example.

## Notes

- Supply credentials through supported provider configuration, never in source files.
- The final plan after apply must report no changes before the configuration is accepted.

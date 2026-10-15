# terraform-volcenginecc-iam-role-policy

## Overview

Terraform module for managing Volcengine IAM ROLE POLICY resources with the `volcenginecc` provider. The caller owns provider authentication, region configuration, and external resources passed by ID.

## Usage

```hcl
module "iam_role_policy" {
  source  = "terraform-volcenginecc-modules/iam-role-policy/volcenginecc"
  version = "~> 1.0"

  # Set the required module inputs for your environment.
}
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
| `volcenginecc_iam_policy` | Module-defined volcenginecc_iam_policy. |
| `volcenginecc_iam_role` | Module-defined volcenginecc_iam_role. |

## Inputs

| Name | Description |
|---|---|
| `role_name` | Module-defined role_name. |
| `display_name` | Module-defined display_name. |
| `description` | Module-defined description. |
| `trust_policy_document` | Module-defined trust_policy_document. |
| `max_session_duration` | Module-defined max_session_duration. |
| `is_service_linked_role` | Module-defined is_service_linked_role. |
| `service_name` | Module-defined service_name. |
| `custom_policies` | Module-defined custom_policies. |
| `managed_policies` | Module-defined managed_policies. |
| `tags` | Module-defined tags. |

## Outputs

| Name | Description |
|---|---|
| `role_id` | Module-defined role_id. |
| `role_name` | Module-defined role_name. |
| `role_trn` | Module-defined role_trn. |
| `custom_policy_trns` | Module-defined custom_policy_trns. |
| `custom_policy_ids` | Module-defined custom_policy_ids. |
| `attached_policies` | Module-defined attached_policies. |

## Examples

- `basic`: independently runnable basic configuration.
- `complete`: independently runnable complete configuration.

## Notes

- Configure credentials using supported provider mechanisms; do not put access keys in module files.
- Review replacement behavior and provider constraints before applying changes.
- Run `terraform plan` after apply and confirm that the second plan has no changes.

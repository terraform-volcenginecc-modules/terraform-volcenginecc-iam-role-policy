# BASIC IAM ROLE POLICY 示例

## 概述

IAM ROLE POLICY 模块的可运行 basic 配置。它从输入变量设置 Provider，并调用已发布的 Registry 模块。

## 用法

```shell
terraform init
terraform plan
terraform apply
terraform plan
terraform destroy
```

## 依赖要求

| 名称 | 版本 |
|---|---|
| Terraform | `>= 1.5.7` |
| OpenTofu | `>= 1.11.8` |

## Providers

| 名称 | 来源 |
|---|---|
| `volcenginecc` | `volcengine/volcenginecc` |

## 资源

| 名称 | 说明 |
|---|---|
| `terraform-volcenginecc-modules/iam-role-policy/volcenginecc` | 已发布的 IAM ROLE POLICY 模块。 |

## 输入

| 名称 | 说明 |
|---|---|
| `role_name` | 模块定义的 role_name。 |
| `configuration_object_trn` | 模块定义的 configuration_object_trn。 |
| `environment` | 模块定义的 environment。 |

## 输出

| 名称 | 说明 |
|---|---|
| `role_name` | 模块定义的 role_name。 |
| `role_trn` | 模块定义的 role_trn。 |
| `role_id` | 模块定义的 role_id。 |
| `custom_policy_ids` | 模块定义的 custom_policy_ids。 |
| `attached_policies` | 模块定义的 attached_policies。 |

## 示例

本目录即为 basic 示例。

## 说明

- 请通过 Provider 支持的配置提供凭据，绝不应写入源文件。
- apply 后的最终 plan 必须报告无变更，才能接受该配置。

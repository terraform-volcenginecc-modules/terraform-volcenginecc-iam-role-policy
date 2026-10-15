# terraform-volcenginecc-iam-role-policy

## 概述

基于 `volcenginecc` Provider 管理火山引擎 IAM ROLE POLICY 资源的 Terraform 模块。调用方负责 Provider 凭据、地域配置，以及通过 ID 传入的外部资源。

## 用法

```hcl
module "iam_role_policy" {
  source  = "terraform-volcenginecc-modules/iam-role-policy/volcenginecc"
  version = "~> 1.0"

  # 请设置适用于当前环境的必填模块输入。
}
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
| `volcenginecc_iam_policy` | 模块定义的 volcenginecc_iam_policy。 |
| `volcenginecc_iam_role` | 模块定义的 volcenginecc_iam_role。 |

## 输入

| 名称 | 说明 |
|---|---|
| `role_name` | 模块定义的 role_name。 |
| `display_name` | 模块定义的 display_name。 |
| `description` | 模块定义的 description。 |
| `trust_policy_document` | 模块定义的 trust_policy_document。 |
| `max_session_duration` | 模块定义的 max_session_duration。 |
| `is_service_linked_role` | 模块定义的 is_service_linked_role。 |
| `service_name` | 模块定义的 service_name。 |
| `custom_policies` | 模块定义的 custom_policies。 |
| `managed_policies` | 模块定义的 managed_policies。 |
| `tags` | 模块定义的 tags。 |

## 输出

| 名称 | 说明 |
|---|---|
| `role_id` | 模块定义的 role_id。 |
| `role_name` | 模块定义的 role_name。 |
| `role_trn` | 模块定义的 role_trn。 |
| `custom_policy_trns` | 模块定义的 custom_policy_trns。 |
| `custom_policy_ids` | 模块定义的 custom_policy_ids。 |
| `attached_policies` | 模块定义的 attached_policies。 |

## 示例

- `basic`：可独立运行的 basic 配置。
- `complete`：可独立运行的 complete 配置。

## 说明

- 请通过 Provider 支持的方式配置凭据，不要将访问密钥写入模块文件。
- 执行变更前请审阅替换行为及 Provider 限制。
- apply 后请再次执行 `terraform plan`，并确认第二次 plan 无变更。

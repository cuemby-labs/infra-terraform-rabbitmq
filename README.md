# RabbitMQ Template

Terraform module which deploys Rabbit MQ on any kubernetes cluster.

## Usage

```hcl
module "rabbitmq" {
  source = "./modules/rabbitmq"               # Path to the Rabbit MQ module

  namespace_name   = "rabbit-mq"              # The namespace where Origin-CA will be created
  release_name     = "rabbitmq"               # The name of the Helm release
  chart_version    = "15.0.1"                 # The version of the Origin-CA Helm chart
  username         = "Username for RabbitMQ"  # Version of the OriginIssuer CRD
  password         = "Password for RabbitMQ"  # List of HTTP RAW URLs for kubernetes manifest
  domain_name      = "dev.domainname.com"     # List of HTTP RAW URLs for kubernetes manifest
  dash_domain_name = "dev-domainname-com"     # List of HTTP RAW URLs for kubernetes manifest
  issuer_name      = "origin-ca-issuer"       # List of HTTP RAW URLs for kubernetes manifest
  issuer_kind      = "ClusterOriginIssuer"    # List of HTTP RAW URLs for kubernetes manifest

  resources = {
    limits = {
      cpu    = "2000m"
      memory = "512Mi"
    }
    requests = {
      cpu    = "1000m"
      memory = "256Mi"
    }
  }
}
```

## Examples

- ...
- ...

## Contributing

Please read our [contributing guide](./docs/CONTRIBUTING.md) if you're interested in contributing to Walrus template.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.23.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.23.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [helm_release.example](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace_name"></a> [namespace_name](#input_namespace_name) | Namespace where Rabbit MQ will be installed. | `string` | `"rabbit-mq"` | no |
| <a name="input_release_name"></a> [release_name](#input_release_name) | Name for the Rabbit MQ Helm release. | `string` | `"rabbitmq"` | no |
| <a name="input_chart_version"></a> [chart_version](#input_chart_version) | Version of the Rabbit MQ Helm chart. | `string` | `"15.0.1"` | no |
| <a name="input_username"></a> [username](#input_username) | Username for RabbitMQ. | `string` | `` | yes |
| <a name="input_password"></a> [password](#input_password) | Password for RabbitMQ. | `string` | `"rabbitmq"` | yes |
| <a name="input_domain_name"></a> [domain_name](#input_domain_name) | Domain name for RabbitMQ, e.g. 'dev.domainname.com'. | `string` | `"dev.domainname.com"` | no |
| <a name="input_dash_domain_name"></a> [dash_domain_name](#input_dash_domain_name) | domain name with dashes for RabbitMQ, e.g. 'dev-domainname-com'. | `string` | `"dev-domainname-com"` | no |
| <a name="input_issuer_name"></a> [issuer_name](#input_issuer_name) | Origin issuer name. | `string` | `"origin-ca-issuer"` | yes |
| <a name="input_issuer_kind"></a> [issuer_kind](#input_issuer_kind) | Origin issuer kind. | `string` | `"ClusterOriginIssuer"` | no |
| <a name="input_resources"></a> [resources](#input_resources) | Resource limits and requests for Cert-Manager pods. | `map(map(string))` | `"See example"` | no |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->

## License

Copyright (c) 2023 [Seal, Inc.](https://seal.io)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [LICENSE](./LICENSE) file for details.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

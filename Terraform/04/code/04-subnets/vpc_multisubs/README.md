## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.vpc_network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.vpc_subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | for dynamic block 'labels' | `map(string)` | `{}` | no |
| <a name="input_net_name"></a> [net\_name](#input\_net\_name) | n/a | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `list(object({zone = string, cidr = string}))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_info"></a> [subnet\_info](#output\_subnet\_info) | n/a |
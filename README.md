# terraform-aws-mq

Summary: terraform module to manage Amazon mq service with rabbit engine

![ci](https://github.com/conventional-changelog/standard-version/workflows/ci/badge.svg)
[![version](https://img.shields.io/badge/version-1.x-yellow.svg)](https://semver.org)

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#Features)
* [Documentation](#Documentation)
* [Usage](#usage)
* [Project Status](#project-status)

## General Information
- automate setup of amazon mq

## Technologies Used
- terraform
- github actions

## Features

* create mq broker
* create security groups for vpn or custom rules

## Documentation

terraform amazon mq broker resource documentation  [_here_](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker)

## Usage

* look at examples/complete/main.tf for usage 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.71.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_mq_broker.mq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker) | resource |
| [aws_security_group.mq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.mq_amqp_broker_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.mq_amqp_broker_ingress_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.mq_console_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.mq_console_ingress_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.mq_mgmt_api_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.mq_mgmt_api_ingress_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.identifier](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_allow_list"></a> [cidr\_allow\_list](#input\_cidr\_allow\_list) | list to allow security group | `list(any)` | `null` | no |
| <a name="input_deployment_mode"></a> [deployment\_mode](#input\_deployment\_mode) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#deployment_mode | `string` | `"SINGLE_INSTANCE"` | no |
| <a name="input_enable_audit_logs"></a> [enable\_audit\_logs](#input\_enable\_audit\_logs) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#audit | `bool` | `false` | no |
| <a name="input_enable_general_logs"></a> [enable\_general\_logs](#input\_enable\_general\_logs) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#general | `bool` | `false` | no |
| <a name="input_engine_type"></a> [engine\_type](#input\_engine\_type) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#engine_type | `string` | `"RabbitMQ"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#engine_version | `string` | `"3.8.22"` | no |
| <a name="input_git"></a> [git](#input\_git) | Name of the Git repo | `string` | `"terraform-aws-mq"` | no |
| <a name="input_host_instance_type"></a> [host\_instance\_type](#input\_host\_instance\_type) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#host_instance_type | `string` | `"mq.t3.micro"` | no |
| <a name="input_maintenance_day_of_week"></a> [maintenance\_day\_of\_week](#input\_maintenance\_day\_of\_week) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#day_of_week | `string` | `"SUNDAY"` | no |
| <a name="input_maintenance_time_of_day"></a> [maintenance\_time\_of\_day](#input\_maintenance\_time\_of\_day) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#time_of_day | `string` | `"07:00"` | no |
| <a name="input_maintenance_time_zone"></a> [maintenance\_time\_zone](#input\_maintenance\_time\_zone) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#time_zone | `string` | `"UTC"` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#publicly_accessible | `bool` | `false` | no |
| <a name="input_source_security_group_id"></a> [source\_security\_group\_id](#input\_source\_security\_group\_id) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule#source_security_group_id | `string` | `""` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#storage_type | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#subnet_ids | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to assign to resources | `map(string)` | `{}` | no |
| <a name="input_username"></a> [username](#input\_username) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#username | `string` | `"mqadminuser"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#arn |
| <a name="output_broker_host"></a> [broker\_host](#output\_broker\_host) | console\_url + https:// prefix |
| <a name="output_console_url"></a> [console\_url](#output\_console\_url) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.console_url |
| <a name="output_id"></a> [id](#output\_id) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#id |
| <a name="output_password"></a> [password](#output\_password) | Rabbit admin password |
| <a name="output_primary_amqp_ssl_endpoint"></a> [primary\_amqp\_ssl\_endpoint](#output\_primary\_amqp\_ssl\_endpoint) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.endpoints |
<!-- END_TF_DOCS -->

## Project Status
Project is: _in_progress_ 

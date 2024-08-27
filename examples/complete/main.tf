terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = ">= 2.0.0"
    }
  }
}

locals {
  git = "terraform-aws-mq"
}

data "aws_vpcs" "this" {
  tags = {
    purpose = "vega"
  }
}

data "aws_subnets" "private" {
  tags = {
    purpose = "vega"
    Type    = "Private"
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.this.ids[0]]
  }
}

variable "enabled" {
  description = "module enabled"
  type        = bool
  default     = true
}

resource "aws_security_group" "test" {
  count       = var.enabled ? 1 : 0
  name_prefix = "test-mq-"
  vpc_id      = data.aws_vpcs.this.ids[0]
}

module "cluster" {
  source                     = "../../"
  vpc_id                     = data.aws_vpcs.this.ids[0]
  source_security_group_id   = try(aws_security_group.test[0].id, "")
  subnet_ids                 = data.aws_subnets.private.ids
  deployment_mode            = "CLUSTER_MULTI_AZ"
  host_instance_type         = "mq.m5.large"
  git                        = local.git
  apply_immediately          = true
  engine_version             = "3.8.22"
  auto_minor_version_upgrade = true
  enabled                    = false
}

module "single_instance" {
  source                     = "../../"
  vpc_id                     = data.aws_vpcs.this.ids[0]
  source_security_group_id   = try(aws_security_group.test[0].id, "")
  subnet_ids                 = [data.aws_subnets.private.ids[0]]
  deployment_mode            = "SINGLE_INSTANCE"
  host_instance_type         = "mq.t3.micro"
  git                        = local.git
  apply_immediately          = true
  engine_version             = "3.8.22"
  use_aws_owned_key          = true
  auto_minor_version_upgrade = true
  enabled                    = var.enabled
}

output "console_url" {
  value       = module.cluster.console_url
  description = "Rabbit console URL"
}

output "primary_amqp_ssl_endpoint" {
  value       = module.cluster.primary_amqp_ssl_endpoint
  description = "AmazonMQ primary AMQP+SSL endpoint"
}

output "broker_host" {
  value       = trim(module.cluster.console_url, "https://")
  description = "console host plus protocol"
}

output "broker_pw" {
  value       = module.cluster.password
  sensitive   = true
  description = "AmazonMQ primary AMQP+SSL endpoint"
}

output "broker_id" {
  value       = module.cluster.id
  description = "rabbit broker id"
}

output "broker_arn" {
  value       = module.cluster.arn
  description = "rabbit broker arn"
}

output "connection_ssm_arn" {
  value = module.cluster.connection_ssm_arn
}
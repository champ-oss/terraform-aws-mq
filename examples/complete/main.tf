terraform {
  backend "s3" {}
}

provider "aws" {
  region = "us-east-2"
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
resource "aws_security_group" "test" {
  name_prefix = "test-mq-"
  vpc_id      = data.aws_vpcs.this.ids[0]
}

module "aws_mq_broker" {
  source                   = "../../"
  vpc_id                   = data.aws_vpcs.this.ids[0]
  source_security_group_id = aws_security_group.test.id
  subnet_ids               = data.aws_subnets.private.ids
  deployment_mode          = "CLUSTER_MULTI_AZ"
  host_instance_type       = "mq.m5.large"
  git                      = local.git
  apply_immediately        = true
}

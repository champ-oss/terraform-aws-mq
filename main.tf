locals {
  tags = {
    cost    = "shared"
    creator = "terraform"
    git     = var.git
  }
}

resource "random_password" "password" {
  length  = 20
  special = false
}

resource "random_string" "identifier" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  numeric = true
}

resource "aws_mq_broker" "mq" {
  broker_name                = substr("${var.git}-${random_string.identifier.result}", 0, 50) # 50 character max length
  engine_type                = var.engine_type
  engine_version             = var.engine_version
  host_instance_type         = var.host_instance_type
  security_groups            = [aws_security_group.mq.id]
  deployment_mode            = var.deployment_mode
  publicly_accessible        = var.publicly_accessible
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  tags                       = merge(local.tags, var.tags)
  subnet_ids                 = var.subnet_ids
  storage_type               = var.storage_type
  apply_immediately          = var.apply_immediately

  logs {
    general = true
  }

  maintenance_window_start_time {
    day_of_week = var.maintenance_day_of_week
    time_of_day = var.maintenance_time_of_day
    time_zone   = var.maintenance_time_zone
  }

  encryption_options {
    use_aws_owned_key = var.use_aws_owned_key
    kms_key_id        = var.use_aws_owned_key ? null : module.kms[0].arn
  }

  /*
  note: AWS currently does not support updating RabbitMQ users. Updates to users can only be in the RabbitMQ UI.
  https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#example-usage
  */

  user {
    username = var.username
    password = random_password.password.result
  }

  # Amazon MQ currently does not support updating the maintenance window. Changes to the maintenance window start time will force a new broker to be created.
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#maintenance_window_start_time

  lifecycle {
    ignore_changes = [
      broker_name,
      engine_version,
      maintenance_window_start_time["day_of_week"],
      maintenance_window_start_time["time_of_day"],
      maintenance_window_start_time["time_zone"]
    ]
  }
}

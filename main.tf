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
  length  = 20
  special = false
  upper   = false
  lower   = true
  number  = true
}

resource "aws_mq_broker" "mq" {
  broker_name                = var.git
  engine_type                = var.engine_type
  engine_version             = var.engine_version
  host_instance_type         = var.host_instance_type
  security_groups            = [aws_security_group.mq.id]
  deployment_mode            = var.deployment_mode
  publicly_accessible        = var.publicly_accessible
  auto_minor_version_upgrade = false
  tags                       = merge(local.tags, var.tags)
  subnet_ids                 = var.subnet_ids
  storage_type               = var.storage_type

  logs {
    general = var.enable_general_logs
    audit   = var.enable_audit_logs
  }

  maintenance_window_start_time {
    day_of_week = var.maintenance_day_of_week
    time_of_day = var.maintenance_time_of_day
    time_zone   = var.maintenance_time_zone
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
      maintenance_window_start_time["day_of_week"],
      maintenance_window_start_time["time_of_day"],
      maintenance_window_start_time["time_zone"]
    ]
  }
}

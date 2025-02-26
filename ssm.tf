resource "aws_ssm_parameter" "this" {
  count       = var.enabled ? 1 : 0
  name        = "${var.git}-mq-${random_string.identifier[0].result}"
  description = "mq password"
  type        = "SecureString"
  value       = random_password.password[0].result
  tags        = merge(local.tags, var.tags)

  lifecycle {
    ignore_changes = [name]
  }
}

module "ssm_connection" {
  count                     = var.ssm_create_connection_parameter ? 1 : 0
  source                    = "github.com/champ-oss/terraform-aws-ssm.git?ref=v1.0.5-78c79ac"
  git                       = var.git
  name                      = var.ssm_prefix_connection
  enable_kms                = length(var.ssm_shared_principal_arns) > 0 ? true : false
  enable_ram_permission     = length(var.ssm_shared_principal_arns) > 0 ? true : false
  enable_random_name_suffix = var.ssm_enable_random_name_suffix
  shared_accounts           = var.ssm_shared_accounts
  shared_principal_arns     = var.ssm_shared_principal_arns
  tags                      = merge(local.tags, var.tags)
  enabled                   = var.enabled
  value = jsonencode({
    (var.ssm_connection_identifier) = var.ssm_connection_identifier_value
    uri                             = try(aws_mq_broker.mq[0].instances[0].endpoints[0], "")
    username                        = var.username
    password                        = try(random_password.password[0].result, "")
  })
}

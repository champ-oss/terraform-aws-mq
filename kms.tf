module "kms" {
  count                   = var.use_aws_owned_key ? 0 : 1
  source                  = "github.com/champ-oss/terraform-aws-kms.git?ref=v1.0.32-a3f9aff"
  git                     = var.git
  name                    = "alias/${var.git}-mq-${random_string.identifier.result}"
  deletion_window_in_days = var.kms_deletion_window_in_days
  account_actions         = []
  tags                    = merge(local.tags, var.tags)
}
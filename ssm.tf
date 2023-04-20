resource "aws_ssm_parameter" "this" {
  name        = "${var.git}-mq-${random_string.identifier.result}"
  description = "mq password"
  type        = "SecureString"
  value       = random_password.password.result
  tags        = merge(local.tags, var.tags)

  lifecycle {
    ignore_changes = [name]
  }
}

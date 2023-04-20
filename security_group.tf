resource "aws_security_group" "mq" {
  name_prefix = "${var.git}-mq-${random_string.identifier.result}"
  vpc_id      = var.vpc_id
  tags        = merge(local.tags, var.tags)

  lifecycle {
    ignore_changes = [name_prefix]
  }
}

resource "aws_security_group_rule" "mq_console_ingress" {
  description              = "ingress to mq console"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.mq.id
  source_security_group_id = var.source_security_group_id
}

resource "aws_security_group_rule" "mq_mgmt_api_ingress" {
  description              = "ingress to mq management api"
  type                     = "ingress"
  from_port                = 15671
  to_port                  = 15671
  protocol                 = "tcp"
  security_group_id        = aws_security_group.mq.id
  source_security_group_id = var.source_security_group_id
}

resource "aws_security_group_rule" "mq_amqp_broker_ingress" {
  description              = "ingress to AMQP-broker-endpoint"
  type                     = "ingress"
  from_port                = 5671
  to_port                  = 5671
  protocol                 = "tcp"
  security_group_id        = aws_security_group.mq.id
  source_security_group_id = var.source_security_group_id
}

resource "aws_security_group_rule" "mq_console_ingress_cidr" {
  count             = var.cidr_allow_list != null ? 1 : 0
  description       = "cidr list to mq console via 443"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.mq.id
  cidr_blocks       = var.cidr_allow_list
}

resource "aws_security_group_rule" "mq_mgmt_api_ingress_cidr" {
  count             = var.cidr_allow_list != null ? 1 : 0
  description       = "cidr list to mq management api via 15671"
  type              = "ingress"
  from_port         = 15671
  to_port           = 15671
  protocol          = "tcp"
  security_group_id = aws_security_group.mq.id
  cidr_blocks       = var.cidr_allow_list
}

resource "aws_security_group_rule" "mq_amqp_broker_ingress_cidr" {
  count             = var.cidr_allow_list != null ? 1 : 0
  description       = "cidr list to AMQP-broker-endpoint via 5671"
  type              = "ingress"
  from_port         = 5671
  to_port           = 5671
  protocol          = "tcp"
  security_group_id = aws_security_group.mq.id
  cidr_blocks       = var.cidr_allow_list
}

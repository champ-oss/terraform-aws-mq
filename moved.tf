moved {
  from = random_password.password
  to   = random_password.password[0]
}

moved {
  from = random_string.identifier
  to   = random_string.identifier[0]
}

moved {
  from = aws_mq_broker.mq
  to   = aws_mq_broker.mq[0]
}

moved {
  from = aws_security_group.mq
  to   = aws_security_group.mq[0]
}


moved {
  from = aws_security_group_rule.mq_console_ingress
  to   = aws_security_group_rule.mq_console_ingress[0]
}

moved {
  from = aws_security_group_rule.mq_mgmt_api_ingress
  to   = aws_security_group_rule.mq_mgmt_api_ingress[0]
}

moved {
  from = aws_security_group_rule.mq_amqp_broker_ingress
  to   = aws_security_group_rule.mq_amqp_broker_ingress[0]
}

moved {
  from = aws_ssm_parameter.this
  to   = aws_ssm_parameter.this[0]
}

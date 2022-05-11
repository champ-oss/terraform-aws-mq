output "console_url" {
  value       = module.aws_mq_broker.console_url
  description = "Rabbit console URL"
}

output "primary_amqp_ssl_endpoint" {
  value       = module.aws_mq_broker.primary_amqp_ssl_endpoint
  description = "AmazonMQ primary AMQP+SSL endpoint"
}

output "broker_host" {
  value       = trim(module.aws_mq_broker.console_url, "https://")
  description = "console host plus protocol"
}

output "broker_pw" {
  value       = module.aws_mq_broker.password
  sensitive   = true
  description = "AmazonMQ primary AMQP+SSL endpoint"
}

output "broker_id" {
  value       = module.aws_mq_broker.id
  description = "rabbit broker id"
}

output "broker_arn" {
  value       = module.aws_mq_broker.arn
  description = "rabbit broker arn"
}
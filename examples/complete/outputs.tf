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
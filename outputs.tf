output "arn" {
  value       = var.enabled ? aws_mq_broker.mq[0].arn : ""
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#arn"
}

output "id" {
  value       = var.enabled ? aws_mq_broker.mq[0].id : ""
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#id"
}

output "console_url" {
  value       = var.enabled ? aws_mq_broker.mq[0].instances[0].console_url : ""
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.console_url"
}

output "broker_host" {
  value       = var.enabled ? trim(aws_mq_broker.mq[0].instances[0].console_url, "https://") : ""
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.console_url"
}

output "ip_address" {
  value       = var.enabled ? aws_mq_broker.mq[0].instances[0].ip_address : ""
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.ip_address"
}

output "password" {
  value       = var.enabled ? random_password.password[0].result : ""
  sensitive   = true
  description = "Rabbit admin password"
}

output "primary_amqp_ssl_endpoint" {
  value       = var.enabled ? aws_mq_broker.mq[0].instances[0].endpoints[0] : ""
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.endpoints"
}

output "instances" {
  value       = var.enabled ? aws_mq_broker.mq[0].instances : []
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances"
}

output "kms_key_id" {
  value       = var.use_aws_owned_key ? null : module.kms[0].key_id
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#key_id"
}

output "kms_arn" {
  value       = var.use_aws_owned_key ? null : module.kms[0].arn
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#arn"
}

output "password_ssm_name" {
  value       = try(aws_ssm_parameter.this[0].name, null)
  description = "The name of the SSM parameter that stores the RabbitMQ password"
}

output "password_ssm_arn" {
  value       = try(aws_ssm_parameter.this[0].arn, null)
  description = "The ARN of the SSM parameter that stores the RabbitMQ password"
}

output "connection_ssm_name" {
  value       = try(module.ssm_connection[0].name, null)
  description = "The name of the SSM parameter that stores the RabbitMQ connection information"
}

output "connection_ssm_arn" {
  value       = try(module.ssm_connection[0].arn, null)
  description = "The ARN of the SSM parameter that stores the RabbitMQ connection information"
}
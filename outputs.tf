output "arn" {
  value       = aws_mq_broker.mq.arn
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#arn"
}

output "id" {
  value       = aws_mq_broker.mq.id
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#id"
}

output "console_url" {
  value       = aws_mq_broker.mq.instances[0].console_url
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.console_url"
}

output "broker_host" {
  value       = trim(aws_mq_broker.mq.instances[0].console_url, "https://")
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.console_url"
}

output "ip_address" {
  value       = aws_mq_broker.mq.instances[0].ip_address
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.ip_address"
}

output "password" {
  value       = random_password.password.result
  sensitive   = true
  description = "Rabbit admin password"
}

output "primary_amqp_ssl_endpoint" {
  value       = aws_mq_broker.mq.instances[0].endpoints[0]
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#instances.0.endpoints"
}

output "instances" {
  value       = aws_mq_broker.mq.instances
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
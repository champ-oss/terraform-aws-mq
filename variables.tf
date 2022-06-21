variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-aws-mq"
}

variable "engine_version" {
  default     = "3.8.22"
  type        = string
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#engine_version"
}

variable "engine_type" {
  default     = "RabbitMQ"
  type        = string
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#engine_type"
}

variable "host_instance_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#host_instance_type"
  default     = "mq.t3.micro"
  type        = string
}

variable "deployment_mode" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#deployment_mode"
  default     = "SINGLE_INSTANCE"
  type        = string
}

variable "publicly_accessible" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#publicly_accessible"
  default     = false
  type        = bool
}

variable "username" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#username"
  default     = "mqadminuser"
  type        = string
}

variable "tags" {
  description = "Tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id"
}

variable "subnet_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#subnet_ids"
  default     = []
  type        = list(string)
}

variable "source_security_group_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule#source_security_group_id"
  default     = ""
  type        = string
}

variable "storage_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#storage_type"
  default     = null
  type        = string
}

variable "maintenance_day_of_week" {
  type        = string
  default     = "SUNDAY"
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#day_of_week"
}

variable "maintenance_time_of_day" {
  type        = string
  default     = "07:00"
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#time_of_day"
}

variable "maintenance_time_zone" {
  type        = string
  default     = "UTC"
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#time_zone"
}

variable "cidr_allow_list" {
  description = "list to allow security group"
  type        = list(any)
  default     = null
}

variable "enable_general_logs" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#general"
  type        = bool
  default     = false
}

variable "enable_audit_logs" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#audit"
  type        = bool
  default     = false
}
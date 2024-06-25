variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-aws-mq"
}

variable "engine_version" {
  default     = "3.10.20"
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

variable "apply_immediately" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#apply_immediately"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#auto_minor_version_upgrade"
  type        = bool
  default     = true
}

variable "use_aws_owned_key" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#use_aws_owned_key"
  type        = bool
  default     = false
}

variable "kms_deletion_window_in_days" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#deletion_window_in_days"
  type        = number
  default     = 30
}

variable "ssm_create_connection_parameter" {
  description = "Create an SSM parameter containing connection information"
  type        = bool
  default     = true
}

variable "ssm_enable_random_name_suffix" {
  description = "Add a random ID to the end of the SSM parameter names"
  type        = bool
  default     = true
}

variable "ssm_shared_accounts" {
  description = "AWS accounts to share the SSM parameters"
  type        = list(string)
  default     = []
}

variable "ssm_shared_principal_arns" {
  description = "AWS principal ARN patterns to share the SSM parameters"
  type        = list(string)
  default     = []
}

variable "ssm_prefix_connection" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter#name"
  type        = string
  default     = "/rabbit/connection"
}

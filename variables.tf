# ============================================
# TERRAFORM VARIABLES
# ============================================

variable "region" {
  description = "AWS region for all accounts"
  type        = string
  default     = "us-east-1"
}

variable "account1_alias" {
  description = "Alias for AWS provider of Account 1"
  type        = string
  default     = "account1"
}

variable "account1_id" {
  description = "AWS account ID for Account 1"
  type        = string
}

variable "account1_role_arn" {
  description = "IAM role ARN to assume in Account 1"
  type        = string
}

variable "account2_alias" {
  description = "Alias for AWS provider of Account 2"
  type        = string
  default     = "account2"
}

variable "account2_id" {
  description = "AWS account ID for Account 2"
  type        = string
}

variable "account2_role_arn" {
  description = "IAM role ARN to assume in Account 2"
  type        = string
}
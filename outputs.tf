# ============================================
# OUTPUTS
# ============================================

# ============================================
# BILLING ACCOUNT OUTPUTS
# ============================================

output "billing_account_id" {
  description = "AWS account ID for billing account"
  value       = var.billing_account_id
}

output "billing_main_vpc" {
  description = "Main VPC ID from billing account"
  value       = data.aws_vpc.billing_main.id
  sensitive   = true
}

output "billing_public_subnets" {
  description = "List of public subnets from billing account"
  value       = data.aws_subnet.billing_public[*].id
  sensitive   = true
}

output "billing_all_subnets" {
  description = "All subnets from billing account"
  value       = data.aws_subnets.billing_all.ids
  sensitive   = true
}

output "billing_web_security_groups" {
  description = "Security groups from billing account with Environment=production and Name=web-*"
  value       = data.aws_security_groups.billing_web.ids
  sensitive   = true
}

# ============================================
# OPERATIONS ACCOUNT OUTPUTS
# ============================================

output "operations_account_id" {
  description = "AWS account ID for operations account"
  value       = var.operations_account_id
}

output "operations_db_security_groups" {
  description = "Security groups from operations account with Environment=production and Name=db-*"
  value       = data.aws_security_groups.operations_db.ids
  sensitive   = true
}
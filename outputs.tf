# ============================================
# OUTPUTS
# ============================================

# ============================================
# ACCOUNT 1 OUTPUTS
# ============================================

output "account1_account_id" {
  description = "AWS account ID for Account 1"
  value       = var.account1_id
}

output "account1_main_vpc" {
  description = "Main VPC ID from Account 1"
  value       = data.aws_vpc.account1_main.id
  sensitive   = true
}

output "account1_public_subnets" {
  description = "List of public subnets from Account 1"
  value       = data.aws_subnet.account1_public[*].id
  sensitive   = true
}

output "account1_all_subnets" {
  description = "All subnets from Account 1"
  value       = data.aws_subnets.account1_all.ids
  sensitive   = true
}

output "account1_web_security_groups" {
  description = "Security groups from Account 1 with Environment=production and Name=web-*"
  value       = data.aws_security_groups.account1_web.ids
  sensitive   = true
}

# ============================================
# ACCOUNT 2 OUTPUTS
# ============================================

output "account2_account_id" {
  description = "AWS account ID for Account 2"
  value       = var.account2_id
}

output "account2_db_security_groups" {
  description = "Security groups from Account 2 with Environment=production and Name=db-*"
  value       = data.aws_security_groups.account2_db.ids
  sensitive   = true
}
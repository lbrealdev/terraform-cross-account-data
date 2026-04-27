# ============================================
# AWS PROVIDERS CROSS-ACCOUNT CONFIGURATION
# ============================================

# Provider for billing account (Account 1)
provider "aws" {
  alias  = "billing"
  region = "us-east-1"

  assume_role {
    role_arn     = var.billing_account_role_arn
    session_name = "terraform-billing-poc"
  }
}

# Provider for operations account (Account 2)
provider "aws" {
  alias  = "operations"
  region = "us-east-1"

  assume_role {
    role_arn     = var.operations_account_role_arn
    session_name = "terraform-operations-poc"
  }
}
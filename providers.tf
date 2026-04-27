# ============================================
# AWS PROVIDERS CROSS-ACCOUNT CONFIGURATION
# ============================================

# Provider for Account 1
provider "aws" {
  alias  = var.account1_alias
  region = var.region

  assume_role {
    role_arn     = var.account1_role_arn
    session_name = "terraform-account1-poc"
  }
}

# Provider for Account 2
provider "aws" {
  alias  = var.account2_alias
  region = var.region

  assume_role {
    role_arn     = var.account2_role_arn
    session_name = "terraform-account2-poc"
  }
}
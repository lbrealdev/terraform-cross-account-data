# ============================================
# DATA SOURCES - ACCOUNT 1 (BILLING)
# ============================================

# Search VPC in billing account
data "aws_vpc" "billing_main" {
  provider = aws.billing

  filter {
    name   = "tag:Name"
    values = ["main-vpc"]
  }
}

# Search public subnets in billing account
data "aws_subnet" "billing_public" {
  provider = aws.billing

  filter {
    name   = "tag:Name"
    values = ["public-*"]
  }
}

# Search all subnets in billing account
data "aws_subnets" "billing_all" {
  provider = aws.billing
}

# Search security groups in billing account
data "aws_security_groups" "billing_web" {
  provider = aws.billing

  filter {
    name   = "tag:Environment"
    values = ["production"]
  }

  filter {
    name   = "tag:Name"
    values = ["web-*"]
  }
}
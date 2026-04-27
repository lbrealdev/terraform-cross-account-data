# ============================================
# DATA SOURCES - ACCOUNT 1 (BILLING)
# ============================================

# Search VPC in Account 1
data "aws_vpc" "account1_main" {
  provider = aws.account1

  filter {
    name   = "tag:Name"
    values = ["main-vpc"]
  }
}

# Search public subnets in Account 1
data "aws_subnet" "account1_public" {
  provider = aws.account1

  filter {
    name   = "tag:Name"
    values = ["public-*"]
  }
}

# Search all subnets in Account 1
data "aws_subnets" "account1_all" {
  provider = aws.account1
}

# Search security groups in Account 1
data "aws_security_groups" "account1_web" {
  provider = aws.account1

  filter {
    name   = "tag:Environment"
    values = ["production"]
  }

  filter {
    name   = "tag:Name"
    values = ["web-*"]
  }
}
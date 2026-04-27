# ============================================
# DATA SOURCES - ACCOUNT 2 (OPERATIONS)
# ============================================

# Search security groups in Account 2
data "aws_security_groups" "account2_db" {
  provider = aws.account2

  filter {
    name   = "tag:Environment"
    values = ["production"]
  }

  filter {
    name   = "tag:Name"
    values = ["db-*"]
  }
}
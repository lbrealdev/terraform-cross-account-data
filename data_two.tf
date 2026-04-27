# ============================================
# DATA SOURCES - ACCOUNT 2 (OPERATIONS)
# ============================================

# Search security groups in operations account
data "aws_security_groups" "operations_db" {
  provider = aws.operations

  filter {
    name   = "tag:Environment"
    values = ["production"]
  }

  filter {
    name   = "tag:Name"
    values = ["db-*"]
  }
}
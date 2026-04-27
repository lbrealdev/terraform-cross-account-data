# Terraform Cross-Account POC

Proof of Concept (POC) using Terraform for multiple providers cross-account with AWS Assume Role.

## 📋 Objective

Access existing resources (VPCs, subnets, security groups) from multiple AWS accounts using **data sources** and **provider aliases**, without creating new resources.

## 🏗️ Architecture

- **Account 1 - Billing**: Billing account, responsible for main infrastructure (VPCs, subnets)
- **Account 2 - Operations**: Operations account, responsible for more critical resources (security groups, etc.)

## 🚀 How to use

### Prerequisites

1. Two configured AWS accounts
2. IAM Roles with read permissions in each account
3. Terraform >= 1.5.0

### Configuration

1. Copy the example file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` and define your accounts and roles:
   ```hcl
   billing_account_role_arn = "arn:aws:iam::YOUR_BILLING_ACCOUNT:role/BillingReadOnlyRole"
   operations_account_role_arn = "arn:aws:iam::YOUR_OPERATIONS_ACCOUNT:role/OperationsReadOnlyRole"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Plan the changes:
   ```bash
   terraform plan
   ```

5. Apply the changes:
   ```bash
   terraform apply
   ```

## 📁 Structure

```
├── providers.tf              # AWS providers configuration
├── versions.tf               # Terraform version requirements
├── outputs.tf                # Output definitions
├── data_one.tf               # Data sources for account 1
├── data_two.tf               # Data sources for account 2
├── terraform.tfvars.example  # Variable configuration example
└── README.md                 # This file
```

## 🔑 Providers

### Account 1 (Billing)
```hcl
provider "aws" {
  alias  = "billing"
  assume_role {
    role_arn     = var.billing_account_role_arn
    session_name = "terraform-billing-poc"
  }
}
```

### Account 2 (Operations)
```hcl
provider "aws" {
  alias  = "operations"
  assume_role {
    role_arn     = var.operations_account_role_arn
    session_name = "terraform-operations-poc"
  }
}
```

## 📊 Data Sources

### Billing Account (data_one.tf)
- `aws_vpc` - Search VPCs by tags
- `aws_subnet` - Search public subnets
- `aws_subnets` - Search all subnets
- `aws_security_groups` - Search security groups by environment and tags

### Operations Account (data_two.tf)
- `aws_security_groups` - Search database security groups by environment and tags

## 📝 Contributing

This is a POC (Proof of Concept) repository - follow your standard git workflow when ready.
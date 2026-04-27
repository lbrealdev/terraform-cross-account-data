# Terraform commands

# Initialize terraform in a solution directory
# Usage: just init
@init:
    terraform init

# Create a plan in a solution directory
# Usage: just plan
@plan *arg:
    terraform plan {{ arg }} -out plan

# Apply a plan in a solution directory
# Usage: just apply
@apply *arg:
    terraform apply {{ arg }} plan

# Format terraform files
# Usage: just fmt
@fmt:
    terraform fmt -write=true -recursive

# Validate terraform configuration
# Usage: just validate
@validate:
    terraform validate

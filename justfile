# Format terraform files
# Usage: just fmt
@fmt:
    terraform fmt -write=true -recursive

# Validate terraform configuration
# Usage: just validate
@validate:
    terraform validate

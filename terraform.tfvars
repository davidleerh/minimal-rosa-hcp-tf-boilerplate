# Copy this file to terraform.tfvars and customize as needed

cluster_name           = "dle-rosa-hcp-cluster"
aws_region            = "us-east-1"
openshift_version     = "4.18.20"
create_admin_user      = true

# RHCS Authentication - replace with your actual credentials
rhcs_client_id     = "redacted - see sandbox vault"
rhcs_client_secret = "redacted - see sandbox vault"

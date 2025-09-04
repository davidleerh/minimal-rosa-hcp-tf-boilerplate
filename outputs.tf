output "cluster_id" {
  description = "ID of the created ROSA HCP cluster"
  value       = module.rosa_cluster_hcp.cluster_id
}

output "cluster_state" {
  description = "State of the cluster"
  value       = module.rosa_cluster_hcp.cluster_state
}

output "api_url" {
  description = "URL of the API server"
  value       = module.rosa_cluster_hcp.cluster_api_url
}

output "console_url" {
  description = "URL of the OpenShift web console"
  value       = module.rosa_cluster_hcp.cluster_console_url
}

output "domain" {
  description = "DNS domain of cluster"
  value       = module.rosa_cluster_hcp.cluster_domain
}

output "oidc_config_id" {
  description = "OIDC config ID"
  value       = module.rosa_cluster_hcp.oidc_config_id
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = module.vpc.cidr_block
}
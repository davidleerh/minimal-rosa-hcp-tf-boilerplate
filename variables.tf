variable "cluster_name" {
  type        = string
  description = "Name of the ROSA HCP cluster"
  default     = "rosa-hcp-test"
}

variable "aws_region" {
  type        = string
  description = "AWS region where the cluster will be created"
  default     = "us-east-1"
}

variable "openshift_version" {
  type        = string
  description = "OpenShift version for the cluster"
  default     = "4.15.0"
}

variable "create_admin_user" {
  type        = bool
  description = "Create cluster admin user"
  default     = true
}

variable "availability_zones_count" {
  type        = number
  description = "Number of availability zones to use"
  default     = 1
}

variable "rhcs_client_id" {
  type        = string
  description = "RHCS client ID for authentication"
  sensitive   = true
}

variable "rhcs_client_secret" {
  type        = string
  description = "RHCS client secret for authentication"
  sensitive   = true
}
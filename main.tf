terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.38.0"
    }
    rhcs = {
      version = ">= 1.6.2"
      source  = "terraform-redhat/rhcs"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "rhcs" {
  # Authentication via client credentials
  client_id     = var.rhcs_client_id
  client_secret = var.rhcs_client_secret
}

locals {
  account_role_prefix  = "${var.cluster_name}-account"
  operator_role_prefix = "${var.cluster_name}-operator"
}

# Create VPC for the cluster
module "vpc" {
  source = "terraform-redhat/rosa-hcp/rhcs//modules/vpc"

  name_prefix              = var.cluster_name
  availability_zones_count = var.availability_zones_count
}

# ROSA HCP Cluster (handles OIDC and IAM roles automatically)
module "rosa_cluster_hcp" {
  source = "terraform-redhat/rosa-hcp/rhcs"

  cluster_name           = var.cluster_name
  openshift_version      = var.openshift_version
  aws_subnet_ids         = concat(module.vpc.public_subnets, module.vpc.private_subnets)
  aws_availability_zones = module.vpc.availability_zones
  
  # Networking
  machine_cidr = module.vpc.cidr_block
  private      = false  # Public cluster
  
  # IAM roles (automatically created)
  create_account_roles  = true
  account_role_prefix   = local.account_role_prefix
  create_oidc           = true
  create_operator_roles = true
  operator_role_prefix  = local.operator_role_prefix
  
  # Admin user
  create_admin_user = var.create_admin_user
  
  # Wait settings
  wait_for_create_complete = true
}
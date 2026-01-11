provider "aws" { region = var.region }

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
  name = var.cluster_name
  cidr = var.vpc_cidr
  azs  = var.azs
  private_subnets = var.private_subnets_cidrs
  public_subnets  = var.public_subnets_cidrs
  enable_nat_gateway = true
  single_nat_gateway = true  # Cost optimization
  enable_dns_hostnames = true
  tags = var.tags
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"
  cluster_name    = var.cluster_name
  cluster_version = var.eks_version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  eks_managed_node_groups = {
    ondemand = {
      min_size     = 1
      max_size     = 3
      desired_size = 2
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
    spot = {  # Cost optimization: Spot for workloads tolerating interruptions
      min_size     = 1
      max_size     = 5
      desired_size = 2
      instance_types = ["t3.large", "t3.xlarge", "t2.large"]  # Diverse Spot pool
      capacity_type  = "SPOT"
      spot_allocation_strategy = "capacity-optimized"
    }
  }
  # IAM roles auto-created with AmazonEKSClusterPolicy, AmazonEKSVPCResourceController
  cluster_endpoint_public_access = true
  enable_irsa = true  # For pod IAM roles
  tags = var.tags
}

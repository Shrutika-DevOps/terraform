module "eks_cluster" {
  source          = "./modules/eks-cluster"
  region          = var.region
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  public_subnets_cidrs  = var.public_subnets_cidrs
  private_subnets_cidrs = var.private_subnets_cidrs
  tags            = var.tags
}

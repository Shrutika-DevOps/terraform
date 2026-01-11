variable "region" {
  description = "AWS region (e.g., eu-central-1 for Munich)"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "Unique name for EKS cluster"
  type        = string
  default     = "shrutika-eks"
}

variable "cluster_version" {
  description = "Kubernetes version (e.g., 1.30)"
  type        = string
  default     = "1.30"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones (e.g., eu-central-1a,c)"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1c"]
}

variable "public_subnets_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}

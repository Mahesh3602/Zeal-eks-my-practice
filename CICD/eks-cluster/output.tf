output "VPC_values" {
  value = aws_eks_cluster.eks-cluster.vpc_config[0]
 
}

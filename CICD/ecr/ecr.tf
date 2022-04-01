resource "aws_ecr_repository" "eks-devops-nginx" {
  name                 = "eks-devops-nginx"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "repository_url" {
  value = aws_ecr_repository.eks-devops-nginx.repository_url
 
}
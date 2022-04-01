resource "aws_codecommit_repository" "eks-devops-nginx" {
  repository_name = "eks-devops-nginx"
  description     = "This is the Sample App Repository"
}

output "git_url" {
  value = aws_codecommit_repository.eks-devops-nginx.clone_url_http
 
}

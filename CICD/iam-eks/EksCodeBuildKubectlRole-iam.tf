resource "aws_iam_role" "EksCodeBuildKubectlRole" {
  name = "EksCodeBuildKubectlRole"
  assume_role_policy = "${file("iam-policy/EksCodeBuildKubectlRole-assume-policy.json")}"

  tags = {
    CreatedBy = "Mahesh"
  }
}

resource "aws_iam_role_policy" "eks-describe" {
  name = "eks-describe"
  role = aws_iam_role.EksCodeBuildKubectlRole.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = "${file("iam-policy/EksCodeBuildKubectlRole-policy.json")}"
}

output "EksCodeBuildKubectlRole" {
  value = aws_iam_role.EksCodeBuildKubectlRole.arn
}
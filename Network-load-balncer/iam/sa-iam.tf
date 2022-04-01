resource "aws_iam_policy" "sa_policy" {
  name = "sa_policy"
  # role = aws_iam_role.sa_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = "${file("iam-policy/sa-latest-policy.json")}"
}

output "base_url" {
  value = aws_iam_policy.sa_policy.arn
}

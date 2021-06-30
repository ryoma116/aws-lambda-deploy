variable "iam_user_name" {}
variable "pgp_key" {}


resource "aws_iam_user" "deploy_user" {
  name = var.iam_user_name
}

resource "aws_iam_access_key" "deploy_user_access_key" {
  user    = aws_iam_user.deploy_user.name
  pgp_key = var.pgp_key
}

resource "aws_iam_user_policy_attachment" "ecr_deploy_policy_attachment" {
  user       = aws_iam_user.deploy_user.name
  policy_arn = aws_iam_policy.allow_deploy.arn
}

output "secret_access" {
  value       = aws_iam_access_key.deploy_user_access_key.encrypted_secret
  description = "IAMユーザの暗号化されたシークレットキー"
}

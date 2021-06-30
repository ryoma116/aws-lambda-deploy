variable "lambda_deploy_iam_policy_name" {}

data "aws_iam_policy_document" "allow_push_ecr" {
  statement {
    sid = "AllowPushEcr"
    effect = "Allow"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload"
    ]
    resources = [
      aws_ecr_repository.hello_world_ecr.arn
    ]
  }
}

data "aws_iam_policy_document" "allow_auth_ecr" {
  statement {
    sid = "AllowAuthEcr"
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "allow_deploy_lambda" {
  statement {
    sid = "AllowDeployLambda"
    effect = "Allow"
    actions = [
      "lambda:*"
    ]
    resources = [
      aws_lambda_function.hello_world_lambda_func.arn
    ]
  }
}

data "aws_iam_policy_document" "allow_deploy" {
  override_policy_documents = [
    data.aws_iam_policy_document.allow_push_ecr.json,
    data.aws_iam_policy_document.allow_auth_ecr.json,
    data.aws_iam_policy_document.allow_deploy_lambda.json
  ]
}

resource "aws_iam_policy" "allow_deploy" {
  name   = var.lambda_deploy_iam_policy_name
  policy = data.aws_iam_policy_document.allow_deploy.json
}


#-------------------------------------------------------
# Lambda実行権限
#-------------------------------------------------------
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

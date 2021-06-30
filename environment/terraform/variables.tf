#-------------------------------------------------------
# for lambda
#-------------------------------------------------------

variable "hello_world_lambda_func_name" {
  default = "terraform-deploy-hello-world-lambda-func"
}

#-------------------------------------------------------
# for ecr
#-------------------------------------------------------

variable "hello_world_ecr_name" {
  default = "terraform-deploy-hello-world-repo"
}

#-------------------------------------------------------
# for iam policy
#-------------------------------------------------------

variable "lambda_deploy_iam_policy_name" {
  default = "terraform-deploy-lambda-deploy"
}

#-------------------------------------------------------
# for iam role
#-------------------------------------------------------

variable "lambda_role" {
  default = "lambda-execute-role"
}

#-------------------------------------------------------
# for iam_user
#-------------------------------------------------------

variable "iam_user_name" {
  default = "train-lambda-deploy-user"
}

variable "pgp_key" {
  description = "IAMユーザーのパスワード生成で利用するpgpの公開鍵(keybaseでuser指定)"
  type        = string
}

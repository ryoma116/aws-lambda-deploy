module "aws" {
  source = "./modules/aws"

  hello_world_lambda_func_name = var.hello_world_lambda_func_name
  hello_world_ecr_name = var.hello_world_ecr_name
  lambda_deploy_iam_policy_name = var.lambda_deploy_iam_policy_name
  iam_user_name = var.iam_user_name
  pgp_key = var.pgp_key
  lambda_role = var.lambda_role
}

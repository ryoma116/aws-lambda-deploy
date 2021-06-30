variable "hello_world_lambda_func_name" {}

resource "aws_lambda_function" "hello_world_lambda_func" {
  function_name = var.hello_world_lambda_func_name
  role = aws_iam_role.lambda_role.arn
  package_type  = "Image"
  image_uri     = "${aws_ecr_repository.hello_world_ecr.repository_url}:latest"
  timeout       = 60

  lifecycle {
    ignore_changes = [image_uri]
  }
}

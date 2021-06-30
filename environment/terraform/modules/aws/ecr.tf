variable "hello_world_ecr_name" {}

resource "aws_ecr_repository" "hello_world_ecr" {
  name                 = var.hello_world_ecr_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

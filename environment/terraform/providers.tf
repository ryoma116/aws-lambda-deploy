terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.24.0"
    }
  }
  required_version = ">= 0.14.0"
}

provider "aws" {
  region  = "ap-northeast-1"
}

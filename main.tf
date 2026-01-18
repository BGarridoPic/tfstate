terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "bgarrido-bucket-tf-state-1234567890"
    key            = "prod/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "mi_bucket_de_app" {
  bucket = "bgarrido-app-bucket-1234567890"
}
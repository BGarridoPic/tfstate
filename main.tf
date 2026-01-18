terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "bgarrido-bucket-tf-state-1234567890" # Coincide con el YAML
    key            = "prod/terraform.tfstate"
    region         = "eu-west-3"                           # Coincide con el YAML
    dynamodb_table = "terraform-lock-table"                # Coincide con el YAML
    encrypt        = true
  }
}

# Nota: Tu Backend está en París (eu-west-3), pero tus recursos
# se crearán en N. Virginia (us-east-1). Esto es válido.
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "mi_bucket_de_app" {
  bucket = "bgarrido-app-bucket-1234567890" # Nombre único para tu app
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
  }
  backend "s3" {
    bucket         = "tform-tfstate"
    key            = "eks/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "eks-statefile"
  }
}

provider "aws" {
  # Configuration options
  # No profile required while using GitHub Actions
  region = "ap-southeast-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
  }
  backend "s3" {
    bucket = "tform-tfstate"
    key = "vpc/terraform.tfstate"
    dynamodb_table = "vpc-statefile"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  # Configuration options
  # No profile required while using GitHub Actions
  region  = "ap-southeast-1"
}
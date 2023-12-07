terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "terraform"
  region  = "ap-southeast-1"
}
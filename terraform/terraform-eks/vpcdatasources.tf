data "aws_vpc" "eksvpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.cf_name}-VPC"]
  }
}

data "aws_subnet" "sub-1" {
  filter {
    name   = "tag:Name"
    values = ["${var.cf_name}-Subnet01"]
  }
}

data "aws_subnet" "sub-2" {
  filter {
    name   = "tag:Name"
    values = ["${var.cf_name}-Subnet02"]
  }
}

data "aws_subnet" "sub-3" {
  filter {
    name   = "tag:Name"
    values = ["${var.cf_name}-Subnet03"]
  }
}

data "aws_security_group" "controlplane" {
  filter {
    name   = "tag:type"
    values = ["POC"]
  }
}
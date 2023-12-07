data "aws_vpc" "eksvpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.cf_name}-VPC"]
  }
  depends_on = [aws_cloudformation_stack.eksvpc]
}

data "aws_subnet" "sub-1" {
  filter {
    name   = "tag:Name"
    values = ["${var.cf_name}-Subnet-01"]
  }
  depends_on = [aws_cloudformation_stack.eksvpc]
}

data "aws_subnet" "sub-2" {
  filter {
    name   = "tag:Name"
    values = ["${var.cf_name}-Subnet-02"]
  }
  depends_on = [aws_cloudformation_stack.eksvpc]
}

data "aws_subnet" "sub-3" {
  filter {
    name   = "tag:Name"
    values = ["${var.cf_name}-Subnet-03"]
  }
  depends_on = [aws_cloudformation_stack.eksvpc]
}

data "aws_security_group" "controlplane" {
  filter {
    name   = "tag:'aws:cloudformation:logical-id'"
    values = ["ControlPlaneSecurityGroup"]
  }
  depends_on = [aws_cloudformation_stack.eksvpc]
}
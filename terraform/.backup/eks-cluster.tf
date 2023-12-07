resource "aws_eks_cluster" "javacluster" {
  name     = var.clustername
  version  = var.k8sversion
  role_arn = var.clusterrole
  vpc_config {
    subnet_ids              = [data.aws_subnet.sub-1.id, data.aws_subnet.sub-2.id, data.aws_subnet.sub-3.id]
    security_group_ids      = [data.aws_security_group.controlplane.id]
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  depends_on = [aws_cloudformation_stack.eksvpc]
}

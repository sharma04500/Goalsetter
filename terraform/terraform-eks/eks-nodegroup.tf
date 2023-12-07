resource "aws_eks_node_group" "javagroup" {
  cluster_name    = var.clustername
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role
  ami_type        = var.node_ami
  instance_types  = [var.instance_type]
  subnet_ids      = [data.aws_subnet.sub-1.id, data.aws_subnet.sub-2.id, data.aws_subnet.sub-3.id]
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
  update_config {
    max_unavailable = 1
  }
  depends_on = [aws_eks_cluster.javacluster, aws_eks_addon.kube-proxy, aws_eks_addon.Pod-Identity, aws_eks_addon.vpc-cni]
}
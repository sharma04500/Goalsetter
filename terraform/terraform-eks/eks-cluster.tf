resource "aws_eks_cluster" "goalcluster" {
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
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name  = var.clustername
  addon_name    = "kube-proxy"
  addon_version = "v1.28.2-eksbuild.2"
  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [ aws_eks_cluster.goalcluster ]
}

resource "aws_eks_addon" "vpc-cni" {
  cluster_name  = var.clustername
  addon_name    = "vpc-cni"
  addon_version = "v1.15.4-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [ aws_eks_cluster.goalcluster ]
}

resource "aws_eks_addon" "CoreDNS" {
  cluster_name  = var.clustername
  addon_name    = "coredns"
  addon_version = "v1.10.1-eksbuild.6"
  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [ aws_eks_cluster.goalcluster, aws_eks_node_group.goalgroup ]
}

resource "aws_eks_addon" "Pod-Identity" {
  cluster_name  = var.clustername
  addon_name    = "eks-pod-identity-agent"
  addon_version = "v1.0.0-eksbuild.1"
  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [ aws_eks_cluster.goalcluster ]
}
resource "aws_eks_node_group" "fiap_node_group" {
  cluster_name    = aws_eks_cluster.fiap_cluster.name
  node_group_name = var.nodeName
  node_role_arn   = var.labRole
  subnet_ids      = [var.subnetA, var.subnetB, var.subnetC]

  scaling_config {
    desired_size = 3
    max_size     = 7
    min_size     = 2
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.medium"]
}

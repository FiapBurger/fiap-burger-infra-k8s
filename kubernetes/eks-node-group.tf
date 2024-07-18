resource "aws_eks_node_group" "ms-customer-node" {
  cluster_name    = aws_eks_cluster.fiap_cluster.name
  node_group_name = var.nodeName
  node_role_arn   = var.labRole
  subnet_ids      = [var.subnetA, var.subnetB, var.subnetC]

  scaling_config {
    desired_size = 3
    max_size     = 7
    min_size     = 1
  }

  instance_types  = ["t3.medium"]
  capacity_type   = "SPOT"

  update_config {
    max_unavailable = 1
  }
}

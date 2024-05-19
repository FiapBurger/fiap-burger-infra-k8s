resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.fiap_burguer.name
  node_group_name = var.nodeName
  node_role_arn   = var.labRole
  subnet_ids      = ["${var.subnetA}", "${var.subnetB}", "${var.subnetC}"]
  instance_types  = ["t3.micro"]
  capacity_type   = SPOT

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

}
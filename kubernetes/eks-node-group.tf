resource "aws_eks_node_group" "ms-customer-node" {
  cluster_name    = aws_eks_cluster.fiap_burguer.name
  
  node_group_name = var.nodeName
  
  node_role_arn   = var.labRole
  
  subnet_ids      = ["${var.subnetA}", "${var.subnetB}", "${var.subnetC}"]
  
  instance_types  = ["t3.micro"]
  
  capacity_type   = "SPOT"

  scaling_config {
    desired_size = 3
    max_size     = 7
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

}

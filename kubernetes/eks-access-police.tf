resource "aws_eks_access_policy_association" "example" {
  cluster_name = aws_eks_cluster.fiap_burguer.name
  policy_arn    = var.arnAdmEks
  principal_arn = var.arnPrincipal

  access_scope {
    type       = "cluster"
  }
}
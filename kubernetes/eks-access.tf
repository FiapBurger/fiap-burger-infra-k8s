resource "aws_eks_access_entry" "access_entry" {
    cluster_name = aws_eks_cluster.fiap_burguer.name
    principal_arn = var.arnPrincipal
    kubernetes_groups = ["fiap_burger", "pos-tech"]
    type = "STANDARD"
}
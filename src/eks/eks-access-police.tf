resource "aws_iam_role_policy_attachment" "eks_admin_policy" {
  role       = var.labRole
  policy_arn = var.arnAdmEks
}
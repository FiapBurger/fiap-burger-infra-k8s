provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "fiap_cluster" {
  name     = "fiap_cluster"
  role_arn = "arn:aws:iam::730335333567:role/LabRole"

  vpc_config {
    subnet_ids = [
      "subnet-081d1613d89ee8ba6",
      "subnet-0b97e6916779e8ddb"
    ]
  }
}

resource "aws_security_group" "eks_lb_sg" {
  name        = "eks-lb-sg"
  description = "Security group for EKS load balancer"
  vpc_id      = aws_eks_cluster.fiap_cluster.vpc_config[0].vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "eks_lb" {
  name               = "eks-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_eks_cluster.fiap_cluster.vpc_config[0].subnet_ids
  security_groups    = [aws_security_group.eks_lb_sg.id]

  tags = {
    Name = "eks-lb"
  }
}

resource "aws_lb_target_group" "eks_target_group" {
  name     = "eks-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_eks_cluster.fiap_cluster.vpc_config[0].vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "eks_lb_listener" {
  load_balancer_arn = aws_lb.eks_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.eks_target_group.arn
    type             = "forward"
  }
}


#provider "aws" {
#  region = "us-east-1"
#}
#
#output "endpoint" {
#  value = aws_eks_cluster.fiap_cluster.endpoint
#}
#
#output "kubeconfig-certificate-authority-data" {
#  value = aws_eks_cluster.fiap_cluster.certificate_authority[0].data
#}
#
#data "aws_iam_policy_document" "assume_role" {
#  statement {
#    effect = "Allow"
#
#    principals {
#      type        = "Service"
#      identifiers = ["eks.amazonaws.com"]
#    }
#
#    actions = ["sts:AssumeRole"]
#  }
#}
#
#resource "aws_iam_role" "fiap_cluster" {
#  name               = "eks-cluster-role"
#  assume_role_policy = data.aws_iam_policy_document.assume_role.json
#}
#
#resource "aws_iam_role_policy_attachment" "example-AmazonEKSClusterPolicy" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#  role       = aws_iam_role.fiap_cluster.name
#}
#
## Optionally, enable Security Groups for Pods
## Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html
#resource "aws_iam_role_policy_attachment" "example-AmazonEKSVPCResourceController" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
#  role       = aws_iam_role.fiap_cluster.name
#}
#
#resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#  role       = aws_iam_role.fiap_node_group_role.name
#}
#
#resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#  role       = aws_iam_role.fiap_node_group_role.name
#}
#
#resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#  role       = aws_iam_role.fiap_node_group_role.name
#}
#
#resource "aws_eks_cluster" "fiap_cluster" {
#  name     = "fiap-burger-eks-cluster"
#  role_arn = "arn:aws:iam::730335333567:role/LabRole"
#
#  vpc_config {
#    subnet_ids = [
#      "subnet-081d1613d89ee8ba6",
#      "subnet-0b97e6916779e8ddb"
#    ]
#  }
#}
#
#resource "aws_iam_role" "fiap_node_group_role" {
#  name = "eks-node-group-ec2-role"
#
#  assume_role_policy = jsonencode({
#    Statement = [{
#      Action = "sts:AssumeRole"
#      Effect = "Allow"
#      Principal = {
#        Service = "ec2.amazonaws.com"
#      }
#    }]
#    Version = "2012-10-17"
#  })
#}
#
#resource "aws_eks_node_group" "fiap_node_group" {
#  cluster_name    = aws_eks_cluster.fiap_cluster.name
#  node_group_name = "fiap_node_group"
#  node_role_arn   = aws_iam_role.fiap_node_group_role.arn
#  subnet_ids = [
#    "subnet-081d1613d89ee8ba6",
#    "subnet-0b97e6916779e8ddb"
#  ]
#
#  scaling_config {
#    desired_size = 1
#    max_size     = 2
#    min_size     = 1
#  }
#
#  update_config {
#    max_unavailable = 1
#  }
#
#  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
#  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#  depends_on = [
#    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
#    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
#    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
#  ]
#}

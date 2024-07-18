provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "fiap_cluster" {
  name     = "fiap-burger-eks-cluster"
  role_arn = "arn:aws:iam::643230847802:role/LabRole"

  vpc_config {
    subnet_ids = [
      "subnet-02332486181d5f757",
      "subnet-065b86e8bc1297d97"
    ]
  }
}

resource "aws_security_group" "fiapburger_sg" {
  name        = "eks-lb-and-nodes-sg"
  description = "Security group for EKS load balancer and nodes"
  vpc_id      = "vpc-008220555f42a21df"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "eks_lb" {
  name               = "eks-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_eks_cluster.fiap_cluster.vpc_config[0].subnet_ids
  security_groups    = [aws_security_group.fiapburger_sg.id]
}

resource "aws_lb_target_group" "eks_target_group" {
  name     = "eks-target-group"
  port     = 31000
  protocol = "HTTP"
  vpc_id   = "vpc-008220555f42a21df"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
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

resource "aws_eks_node_group" "ms-customer-node" {
  cluster_name    = aws_eks_cluster.fiap_cluster.name
  node_group_name = var.nodeName
  node_role_arn   = var.labRole
  subnet_ids      = [var.subnetA, var.subnetB, var.subnetC]

  scaling_config {
    desired_size = 4
    max_size     = 7
    min_size     = 1
  }

  instance_types  = ["t3.medium"]
  capacity_type   = "SPOT"

  update_config {
    max_unavailable = 1
  }
}



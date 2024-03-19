provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "fiap_cluster" {
  name     = "fiap-burger-eks-cluster"
  role_arn = "arn:aws:iam::730335333567:role/LabRole"

  vpc_config {
    subnet_ids = [
      "subnet-081d1613d89ee8ba6",
      "subnet-0b97e6916779e8ddb"
    ]
  }
}

resource "aws_security_group" "fiapburger_sg" {
  name        = "eks-lb-and-nodes-sg"
  description = "Security group for EKS load balancer and nodes"
  vpc_id      = aws_eks_cluster.fiap_cluster.vpc_config[0].vpc_id

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

  tags = {
    Name = "eks-lb"
  }
}

resource "aws_lb_target_group" "eks_target_group" {
  name     = "eks-target-group"
  port     = 31000
  protocol = "HTTP"
  vpc_id   = aws_eks_cluster.fiap_cluster.vpc_config[0].vpc_id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = 31000
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "eks_lb_listener" {
  load_balancer_arn = aws_lb.eks_lb.arn
  port              = 31000
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.eks_target_group.arn
    type             = "forward"
  }
}

resource "aws_launch_template" "eks_node_lt" {
  name_prefix   = "eks-node-lt-"
  image_id      = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"

  network_interfaces {
    security_groups = [aws_security_group.fiapburger_sg.id]
    associate_public_ip_address = true
  }

  iam_instance_profile {
    arn = "arn:aws:iam::730335333567:role/LabRole"
  }

  user_data = base64encode(<<EOF
  #!/bin/bash
  set -o xtrace
  /etc/eks/bootstrap.sh ${aws_eks_cluster.fiap_cluster.name}
  EOF
  )
}

resource "aws_autoscaling_group" "eks_nodes" {
  launch_template {
    id      = aws_launch_template.eks_node_lt.id
    version = "$Latest"
  }

  min_size         = 1
  max_size         = 3
  desired_capacity = 1

  vpc_zone_identifier = [
    "subnet-081d1613d89ee8ba6",
    "subnet-0b97e6916779e8ddb"
  ]
}
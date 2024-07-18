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
  subnets            = [var.subnetA, var.subnetB]
  security_groups    = [aws_security_group.fiapburger_sg.id]
}

resource "aws_lb_target_group" "eks_target_group" {
  name     = "eks-target-group"
  port     = 31000
  protocol = "HTTP"
  vpc_id   = "vpc-008220555f42a21df"
  target_type = "ip"

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

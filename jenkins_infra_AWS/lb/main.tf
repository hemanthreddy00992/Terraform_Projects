resource "aws_lb" "my_lb" {
  name               = "mylb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = (var.subnet_id)

  enable_deletion_protection = false

}

resource "aws_lb_target_group_attachment" "my_lb_attachment" {
  target_group_arn = var.lb_tg_arn
  target_id        = "var.ec2_instance_id"
  port             = 8080
}

resource "aws_lb_listener" "my_lb_listner" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.lb_tg_arn
  }
}


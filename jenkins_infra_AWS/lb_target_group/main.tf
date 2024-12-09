resource "aws_lb_target_group" "my_lb_target" {
  name     = "mylbtarget"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/login"
    port = 8080
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    matcher = "200"  # has to be HTTP 200 or fails
  }
}

#resource "aws_lb_target_group_attachment" "my_lb_tg_attachment" {
#  target_group_arn = aws_lb_target_group.my_lb_target.arn
#  target_id        = var.ec2_instance_id
#  port             = 8080
#}

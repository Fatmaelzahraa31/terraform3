resource "aws_lb" "public-lb1" {
  name               = "public-lb1"
  internal           = false
  security_groups    = [aws_security_group.sg1.id]
  subnets            = [aws_subnet.pbsub1.id , aws_subnet.pbsub2.id ]
  load_balancer_type = "application1"
}
  # Create a target group
 resource "aws_lb_target_group" "front-tg" {
  name     = "application-front"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 10
    matcher = 200
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 3
    unhealthy_threshold = 2
  }
}
resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.front-tg.arn
  target_id        = aws_instance.ec2-1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "attach-app1" {
  target_group_arn = aws_lb_target_group.front-tg.arn
  target_id        = aws_instance.ec22.id
  port             = 80
}

resource "aws_lb_listener" "front-listen" {
  load_balancer_arn = aws_lb.front-tg.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front-tg.arn
  }
}
# resource "aws_lb" "private-lb" {
#   name               = "private-lb"
#   internal           = true
#   security_groups    = [aws_security_group.example.id]
#   subnets            = [aws_subnet.example.id]
#   load_balancer_type = "application"

#   # Create a target group
#   target_group {
#     name     = "example-tg"
#     port     = 80
#     protocol = "HTTP"
#     vpc_id   = aws_vpc.example.id

#     # Create a health check
#     health_check {
#       path                = "/health"
#       interval            = 30
#       timeout             = 5
#       healthy_threshold   = 2
#       unhealthy_threshold = 2
#       matcher             = "200-299"
#     }
#   }
# }
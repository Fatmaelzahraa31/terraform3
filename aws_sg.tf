resource "aws_security_group" "sg1" {
  vpc_id     = aws_vpc.vpc.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = [var.cidr-block]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.cidr-block]
  }
  tags = {
    Name = "mysecurity-group1"
  }
}

resource "aws_security_group" "sg2" {
  vpc_id     = aws_vpc.vpc.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = [var.cidr-block]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.cidr-block]
  }
  tags = {
    Name = "mysecurity-group2"
  }
}
# resource "aws_security_group" "reverse_proxy" {
#   name        = "reverse-proxy"
#   description = "Security group for reverse proxy"

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
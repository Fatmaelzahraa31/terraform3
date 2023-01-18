resource "aws_internet_gateway" "ig1" {
  vpc_id     = aws_vpc.vpc.id
  tags       = {
    Name = "myig1"
  }
}

resource "aws_internet_gateway" "ig2" {
  vpc_id     = aws_vpc.vpc.id
  tags       = {
    Name = "myig2"
  }
}

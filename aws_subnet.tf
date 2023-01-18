resource "aws_subnet" "pbsub1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pbsubnet[0]
  map_public_ip_on_launch = "true" 
  availability_zone       = var.zone[0]
  tags                    = {
    Name = "mypbsub1"
  }
}

resource "aws_subnet" "ptsub1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.ptsubnet[0]
  map_public_ip_on_launch = "false" 
  availability_zone       = var.zone[0]
  tags                    = {
    Name = "myptsub1"
  }
}


resource "aws_subnet" "pbsub2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pbsubnet[1]
  map_public_ip_on_launch = "true" 
  availability_zone       = var.zone[1]
  tags                    = {
    Name = "mypbsub2"
  }
}

resource "aws_subnet" "ptsub2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.ptsubnet[1]
  map_public_ip_on_launch = "false" 
  availability_zone       = var.zone[1]
  tags                    = {
    Name = "myptsub2"
  }
}
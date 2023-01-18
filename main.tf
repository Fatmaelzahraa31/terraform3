module "vpc" {
source = "./vpc"
cidr_block       = var.cidr
} 
module "pbsub1" {
  source = "./subnet"
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pbsubnet[0]
  map_public_ip_on_launch = "true" 
  availability_zone       = var.zone[0]
}


module "pbsub2" {
  source = "./subnet"
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.ptsubnet[0]
  map_public_ip_on_launch = "false" 
  availability_zone       = var.zone[0]
}

module "ptsub1" {
  source = "./subnet"
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pbsubnet[1]
  map_public_ip_on_launch = "true" 
  availability_zone       = var.zone[1]
}

module "ptsub2" {
  source = "./subnet"
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.ptsubnet[1]
  map_public_ip_on_launch = "false" 
  availability_zone       = var.zone[1]
}

module "ig1" {
  source = "./ig-nat"
  vpc_id     = aws_vpc.vpc.id
}

module "ig2" {
  source = "./ig-nat"
  vpc_id     = aws_vpc.vpc.id
}

module "eip1" {
    source = "./ig-nat"
    vpc = true
    depends_on = [
        aws_internet_gateway.ig1
    ]
}

module "nat-gateway1" {
  source = "./ig-nat"
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.pbsub2.id
   depends_on = [
    aws_internet_gateway.ig1
   ]
}

module "eip2" {
    source = "./ig-nat"
    vpc = true
    depends_on = [
        aws_internet_gateway.ig2
    ]
}
module "nat-gateway2" {
  source = "./ig-nat"
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.pbsub2.id
   depends_on = [
    aws_internet_gateway.ig2
   ]
}



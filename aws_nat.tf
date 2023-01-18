resource "aws_eip" "eip1" {
    vpc = true
    depends_on = [
        aws_internet_gateway.ig1
    ]
}

resource "aws_nat_gateway" "nat-gateway1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.pbsub1.id
   depends_on = [
    aws_internet_gateway.ig1
   ]

  tags = {
    Name = "mynat-gateway1"
  }

}


resource "aws_eip" "eip2" {
    vpc = true
    depends_on = [
        aws_internet_gateway.ig2
    ]
}

resource "aws_nat_gateway" "nat-gateway2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.pbsub2.id
   depends_on = [
    aws_internet_gateway.ig2
   ]

  tags = {
    Name = "mynat-gateway2"
  }

}
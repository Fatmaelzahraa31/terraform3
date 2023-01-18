resource "aws_route_table" "pbroute-table1" {
  vpc_id       = aws_vpc.vpc.id
  route {
    cidr_block = var.pbroute
    gateway_id = aws_internet_gateway.ig1.id
  }
  tags         = {
    Name = "mypbroute-table1"
  }
}

resource "aws_route_table_association" "pbroute-table-assoc1" {
  subnet_id      = aws_subnet.pbsub1.id
  route_table_id = aws_route_table.pbroute-table1.id
}



resource "aws_route_table" "ptroute-table1" {
  vpc_id       = aws_vpc.vpc.id
  route {
    cidr_block = var.ptroute
    gateway_id = aws_nat_gateway.nat-gateway1.id
  }
  tags         = {
    Name = "myptroute-table1"
  }
}

resource "aws_route_table_association" "ptroute-table-assoc1" {
  subnet_id      = aws_subnet.ptsub1.id
  route_table_id = aws_route_table.ptroute-table1.id
}


resource "aws_route_table" "pbroute-table2" {
  vpc_id       = aws_vpc.vpc.id
  route {
    cidr_block = var.pbroute
    gateway_id = aws_internet_gateway.ig2.id
  }
  tags         = {
    Name = "mypbroute-table2"
  }
}

resource "aws_route_table_association" "pbroute-table-assoc2" {
  subnet_id      = aws_subnet.pbsub2.id
  route_table_id = aws_route_table.pbroute-table2.id
}



resource "aws_route_table" "ptroute-table2" {
  vpc_id       = aws_vpc.vpc.id
  route {
    cidr_block = var.ptroute
    gateway_id = aws_nat_gateway.nat-gateway2.id
  }
  tags         = {
    Name = "myptroute-table2"
  }
}

resource "aws_route_table_association" "ptroute-table-assoc2" {
  subnet_id      = aws_subnet.ptsub2.id
  route_table_id = aws_route_table.ptroute-table2.id
}

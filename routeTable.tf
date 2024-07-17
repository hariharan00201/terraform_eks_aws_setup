resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
     Name = "${local.env}-${local.eks_name}-rt-private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
     Name = "${local.env}-${local.eks_name}-rt-public"
  }
}

resource "aws_route_table_association" "private_zone1" {
  subnet_id = aws_subnet.ap-south-1a-private-subnet.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_zone2" {
  subnet_id = aws_subnet.ap-south-1b-private-subnet.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_zone1" {
  subnet_id = aws_subnet.ap-south-1a-public-subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_zone2" {
  subnet_id = aws_subnet.ap-south-1b-public-subnet.id
  route_table_id = aws_route_table.public.id
}
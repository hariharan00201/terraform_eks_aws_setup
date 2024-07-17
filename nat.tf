resource "aws_eip" "ip" {
  domain = "vpc"

  tags = {
     Name = "${local.env}-${local.eks_name}-nat-ip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.ip.id
  subnet_id = aws_subnet.ap-south-1a-public-subnet.id

  tags = {
     Name = "${local.env}-${local.eks_name}-nat"
  }
  depends_on = [ aws_internet_gateway.igw ]
}
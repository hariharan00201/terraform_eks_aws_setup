resource "aws_subnet" "ap-south-1a-private-subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/19"
  availability_zone = local.zone1

  tags = {
    "Name" = "${local.env}-${local.eks_name}-${local.zone1}-private"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "ap-south-1b-private-subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.32.0/19"
  availability_zone = local.zone2

  tags = {
    "Name" = "${local.env}-${local.eks_name}-${local.zone2}-private"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "ap-south-1a-public-subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.64.0/19"
  availability_zone = local.zone1
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${local.env}-${local.eks_name}-${local.zone1}-public"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}

resource "aws_subnet" "ap-south-1b-public-subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.96.0/19"
  availability_zone = local.zone2
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${local.env}-${local.eks_name}-${local.zone2}-public"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"
  }
}
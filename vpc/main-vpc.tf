resource "aws_vpc" "vpc-tf" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "VPC-A" }
}

resource "aws_internet_gateway" "ipg-tf" {
  vpc_id = aws_vpc.vpc-tf.id
  tags   = { Name = "igw-tf" }
}

resource "aws_subnet" "SN-01" {
  vpc_id                  = aws_vpc.vpc-tf.id
  cidr_block              = var.cidr_blocks[0]
  availability_zone       = var.availability_zones [0]
  map_public_ip_on_launch = true
  tags                    = { Name = "SN-01" }
}

resource "aws_subnet" "SN-02" {
  vpc_id                  = aws_vpc.vpc-tf.id
  cidr_block              = var.cidr_blocks[1]
  availability_zone       = var.availability_zones [1]
  map_public_ip_on_launch = true
  tags                    = { Name = "SN-02" }
}

resource "aws_subnet" "SN-03" {
  vpc_id                  = aws_vpc.vpc-tf.id
  cidr_block              = var.cidr_blocks[2]
  availability_zone       = var.availability_zones [2]
  map_public_ip_on_launch = true
  tags                    = { Name = "SN-03" }
}

resource "aws_subnet" "SN-04" {
  vpc_id                  = aws_vpc.vpc-tf.id
  cidr_block              = var.cidr_blocks[3]
  availability_zone       = var.availability_zones [3]
  map_public_ip_on_launch = true
  tags                    = { Name = "SN-04" }
}

resource "aws_route_table" "RT-public" {
  vpc_id = aws_vpc.vpc-tf.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ipg-tf.id
  }
  tags = { Name = "RT-A" }
}

resource "aws_route_table_association" "RT-SN-01" {
  subnet_id      = aws_subnet.SN-01.id
  route_table_id = aws_route_table.RT-public.id
}

resource "aws_route_table_association" "RT-SN-02" {
  subnet_id      = aws_subnet.SN-02.id
  route_table_id = aws_route_table.RT-public.id
}

resource "aws_route_table_association" "RT-SN-03" {
  subnet_id      = aws_subnet.SN-03.id
  route_table_id = aws_route_table.RT-public.id
}

resource "aws_route_table_association" "RT-SN-04" {
  subnet_id      = aws_subnet.SN-04.id
  route_table_id = aws_route_table.RT-public.id
}

output "vpc-tf-id" {
  value = aws_vpc.vpc-tf.id
}

output "subnet-ids" {
    value = [aws_subnet.SN-01.id, aws_subnet.SN-02.id, aws_subnet.SN-03.id, aws_subnet.SN-04.id]
}
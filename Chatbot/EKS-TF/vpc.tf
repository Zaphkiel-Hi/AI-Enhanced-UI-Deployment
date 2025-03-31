# VPC Creation
resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "chatbot"
  }
}

# Public Subnet 1 (ap-south-1a)
resource "aws_subnet" "public-subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "chatbot"
  }
}

# Public Subnet 2 (ap-south-1b)
resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "chatbot-2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "chatbot"
  }
}

# Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "chatbot"
  }
}

# Route Table Association - Public Subnet 1
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.rt.id
}

# Route Table Association - Public Subnet 2
resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.rt.id
}

# Security Group
resource "aws_security_group" "sg-default" {
  vpc_id = aws_vpc.vpc.id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
  }

  tags = {
    Name = "chatbot-sg"
  }
}

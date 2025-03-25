resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"  # CIDR block for the VPC
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "chatbot"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"  # CIDR block for subnet2
  availability_zone       = "ap-south-1b"   # Availability zone (ap-south-1b)
  map_public_ip_on_launch = true

  tags = {
    Name = "chatbot-2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

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

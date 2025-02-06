provider "aws" {
    region   = "eu-west-1"
    profile  = "default"
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public-sub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/28"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Main"
  }
}
resource "aws_subnet" "public-sub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.16/28"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Main"
  }
}
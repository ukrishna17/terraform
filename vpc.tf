resource "aws_vpc" "vprofile" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vprofile"
  }
}

resource "aws_subnet" "vprofile-pub-1" {
  vpc_id     = aws_vpc.vprofile.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags = {
    Name = "vpro-pub-1"
  }
}

resource "aws_subnet" "vprofile-pub-2" {
  vpc_id     = aws_vpc.vprofile.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"
  tags = {
    Name = "vpro-pub-2"
  }
}

resource "aws_subnet" "vprofile-pub-3" {
  vpc_id     = aws_vpc.vprofile.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1c"
  tags = {
    Name = "vpro-pub-3"
  }
}

resource "aws_subnet" "vprofile-priv-1" {
  vpc_id     = aws_vpc.vprofile.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags = {
    Name = "vpro-priv-1"
  }
}

resource "aws_subnet" "vprofile-priv-2" {
  vpc_id     = aws_vpc.vprofile.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"
  tags = {
    Name = "vpro-priv-2"
  }
}

resource "aws_subnet" "vprofile-priv-3" {
  vpc_id     = aws_vpc.vprofile.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1c"
  tags = {
    Name = "vpro-pri-3"
  }
}

resource "aws_internet_gateway" "vpro_igw" {
  vpc_id = aws_vpc.vprofile.id

  tags = {
    Name = "vprofile_IGW"
  }
}

resource "aws_route_table" "vprofile-pub-RT" {
  vpc_id = aws_vpc.vprofile.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpro_igw.id
  }

  tags = {
    Name = "vpro-pub-RT"
  }
}

resource "aws_route_table_association" "vpro-pub-1-a" {
  subnet_id      = aws_subnet.vprofile-pub-1.id
  route_table_id = aws_route_table.vprofile-pub-RT.id
}

resource "aws_route_table_association" "vpro-pub-2-a" {
  subnet_id      = aws_subnet.vprofile-pub-2.id
  route_table_id = aws_route_table.vprofile-pub-RT.id
}

resource "aws_route_table_association" "vpro-pub-3-a" {
  subnet_id      = aws_subnet.vprofile-pub-3.id
  route_table_id = aws_route_table.vprofile-pub-RT.id
}

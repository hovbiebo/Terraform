# create vpc
# terraform aws create vpc
resource "aws_vpc" "Training_vpc" {
  cidr_block              = "10.0.0.0/16"
  instance_tenancy        = "default"
  enable_dns_hostnames    = "false"

  tags      = {
    Name    = "Training_Main"
  }
}

# create internet gateway and attach it to vpc
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.Training_vpc.id

  tags      = {
    Name    = "Training_Main"
  }
}

# create public subnet az1
# terraform aws create subnet
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.Training_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = "false"

  tags      = {
    Name    = "Training_Main"
  }
}

# create public subnet az2
# terraform aws create subnet
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.Training_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = "false"

  tags      = {
    Name    = "Training_Main"
  }
}

# create route table and add public route
# terraform aws create route table
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.Training_vpc.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "Training_Main"
  }
}

# associate public subnet az1 to "public route table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az1.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "public route table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_az2.id
  route_table_id      = aws_route_table.public_route_table.id
}

# create private app subnet az1
# terraform aws create subnet
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id                   = aws_vpc.Training_vpc.id
  cidr_block               = "10.0.3.0/24"
  availability_zone        = "us-east-2a"
  map_public_ip_on_launch  = "false"

  tags      = {
    Name    = "Training_Main"
  }
}

# create private app subnet az2
# terraform aws create subnet
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id                   = aws_vpc.Training_vpc.id
  cidr_block               = "10.0.4.0/24"
  availability_zone        = "us-east-2b"
  map_public_ip_on_launch  = "false"

  tags      = {
    Name    = "Training_Main"
  }
}

# create private data subnet az1
# terraform aws create subnet
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                   = aws_vpc.Training_vpc.id
  cidr_block               = "10.0.5.0/24"
  availability_zone        = "us-east-2a"
  map_public_ip_on_launch  = "false"

  tags      = {
    Name    = "Training_Main"
  }
}

# create private data subnet az2
# terraform aws create subnet
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id                   = aws_vpc.Training_vpc.id
  cidr_block               = "10.0.6.0/24"
  availability_zone        = "us-east-2b"
  map_public_ip_on_launch  = "false"

  tags      = {
    Name    = "Training_Main"
  }
}
# creating vpc, name, CIDR block & tags.
resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

# creating public subnet, interpolating with vpc, CIDR block, tags, availabilty zone
resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
        Name = "pub_subnet"
  }
}

# creating private subnet, interpolating with vpc, CIDR block, tags, availabilty zone
resource "aws_subnet" "priv_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "false"
  tags = {
        Name = "priv_subnet"
  }
}

#creating internet gateway, connecting with vpc
resource "aws_internet_gateway" "IGW1" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
        name = "IGW1"
  }
}

#creating route table for internet gateway and public subnets
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW1.id
  }
  tags = {
        name = "pub_rt"
        }
}

#creating route table for private subnets
resource "aws_route_table" "priv_rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
        name = "priv_rt"
        }
}

#creating route table association with public subnet
resource "aws_route_table_association" "pubRTA"{
  subnet_id = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.pub_rt.id
}

#creating route table association with private subnet
resource "aws_route_table_association" "privRTA"{
  subnet_id = aws_subnet.priv_subnet.id
  route_table_id = aws_route_table.priv_rt.id
}

# aws instance creation in public subnet
resource "aws_instance" "instance1" {
  ami = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name = "terraf"
  subnet_id = aws_subnet.pub_subnet.id
  tags = {
        Name = "instance1"
  }
}

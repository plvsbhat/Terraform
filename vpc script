# Configure the AWS Provider
provider "aws" {
      region = "ap-northeast-1"
      access_key = "AKIAXAWGL6NCP4DBKKZ5"
      secret_key = "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"
}

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
  cidr_block = "10.0.0.0/20"
  availability_zone = "ap-northeast-1a"
  tags = {
        Name = "pub_subnet"
  }
}

# aws instance creation in public subnet
resource "aws_instance" "instance1" {
  ami = "ami-0590f3a1742b17914"
  instance_type = "t2.micro"
  key_name = "terra"
  subnet_id = aws_subnet.pub_subnet.id
  tags = {
        Name = "instance1"
  }
}


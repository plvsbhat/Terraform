resource "aws_instance" "instance1" {
    ami = "ami-06878d265978313ca"
    instance_type = "t2.micro"
    key_name = "terraf"

        tags = {
            Name = "I1"
        }
}

resource "aws_security_group" "ec2-sg" {
  name = "sg1"

  ingress {
     from_port ="22"
         to_port = "22"
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
     from_port ="80"
         to_port = "80"
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
     from_port = "0"
         to_port = "0"
         protocol = "-1"
         cidr_blocks = ["0.0.0.0/0"]
  }
}

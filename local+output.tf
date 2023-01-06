provider "aws" {
        region = "us-east-1"
        access_key = "AKIAXAWGL6NCND5BAT6A"
        secret_key = "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"
}
locals {
        owner = "terraf"
}

resource "aws_instance" "master"{
        ami = "ami-06878d265978313ca"
        instance_type = "t2.micro"
        key_name = "${local.owner}"
 tags = {
        Name = "ubuntu"
 }
}

output "information" {
        value = aws_instance.master.public_ip
}

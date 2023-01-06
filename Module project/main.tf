provider "aws" {
        region = "${var.region}"
        access_key = "${var.access_key}"
        secret_key = "${var.secret_key}"
}

module "ec2" {
        source = "/home/ubuntu/Terraform/ec2"
}

module "vpc" {
        source = "/home/ubuntu/Terraform/vpc"
}

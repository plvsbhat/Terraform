variable "access_key" {}
variable "secret_key" {}
variable "region" {
        default = "us-east-1"
}
variable "ami_id" {
        type = map
        default = {
                us-east-1 = "ami-06878d265978313ca"
                us-east-2 = "ami-0ff39345bd62c82a5"
                us-west-1 = "ami-06bb3ee01d992f30d"
        }
}
variable "instance_type" {
        default = "t2.micro"
}
variable "ec2_keypair" {
        default = "terraf"
}

# Configure the AWS Provider
provider "aws" {
      region = "us-east-1"
      access_key = "AKIAXAWGL6NCC67WF6KW"
      secret_key = "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"
}

#configure the s3 bucket
resource "aws_s3_bucket" "buck" {
        bucket = "vish--s3"
        tags = {
                name = "buck"
        }
}

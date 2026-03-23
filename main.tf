provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*x86_64-gp2"]
  }
}

resource "aws_instance" "infra_demo" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name        = "infra-demo"
    Project     = "week7"
    Owner       = "Dilpreet"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "prashant-week7-demo-bucket-12345"  # must be globally unique

  tags = {
    Name        = "week7-bucket"
    Project     = "week7"
    Owner       = "Dilpreet"
    Environment = "dev"
  }
}

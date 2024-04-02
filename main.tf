provider "aws" {
  region = var.region
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_instance" "mspr-ec2" {
  ami           = "ami-0ebd2bf0042bb3e85"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "mspr-ec2"
  }
}

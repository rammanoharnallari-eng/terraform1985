terraform {
  backend "s3" {
    bucket         = "my-terraform-states"
    key            = "ec2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}


resource "aws_instance" "worker-node" {
  ami           = "ami-0de716d6197524dd9"
  instance_type = "t2.micro"
  #tenancy       = "host"

  tags = {
    Name        = "worker-node"
    Environment = "Development"
  }
}



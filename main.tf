resource "aws_instance" "my_ec2" {
  ami           = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"
  subnet_id = "subnet-03a9fea22426a5900"
}

provider "aws" {
  region  = "us-east-1"
  profile = "mini-project-profile"
}
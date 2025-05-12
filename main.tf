resource "aws_s3_bucket" "tf_state" {
  bucket = "mike-tfstate-bucket-2025"  # Имя должно быть уникальным по AWS
  force_destroy = true

  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"
  subnet_id     = "subnet-03a9fea22426a5900"

  tags = {
    Name = "MyDevInstance"
  }
}

resource "aws_instance" "my_ec2_b" {
  ami           = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"
  subnet_id     = "subnet-03a9fea22426a5900"

  tags = {
    Name = "MyDevInstance-B"
  }
}
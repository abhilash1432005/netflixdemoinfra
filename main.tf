provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-01a00762f46d584a1"
  instance_type          = "t2.medium"
  key_name               = "jenkins"
  vpc_security_group_ids = ["sg-04e4535b9d0dd070f"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}

resource "aws_s3_bucket" "two" {
  bucket = "Abhi-jenkins140305"
}

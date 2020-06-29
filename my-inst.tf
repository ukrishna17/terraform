provider "aws" {
   access_key = "AKIAIMAMDG4MM46QOIPQ"
   secret_key = "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"
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami = "ami-0ac80df6eff0e70b5"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "Terra-Key"
  vpc_security_group_ids = ["sg-264f5d0c"]
  tags = {
    Name = "my-dino"
  }
}

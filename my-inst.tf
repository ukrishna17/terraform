provider "aws" {
   region = "us-east-1"
   access_key = "AKIAY6WKB34P47T37T4B"
   secret_key = "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"

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

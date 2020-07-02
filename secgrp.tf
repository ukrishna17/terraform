resource "aws_security_group" "vpro_stack_sg" {
  name        = "vpro_ssh-sg"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.vprofile.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.212.249.206/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "vpro_stack_sg" {
  name        = "vpro_ssh-sg"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.vprofile.id

  ingress {
    description = "SSH from my computer"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["122.169.225.241/32"]
  }
  ingress {
    description = "SSH from jenkins server "
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = ["sg-0b29a2c1579c9651a"]
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

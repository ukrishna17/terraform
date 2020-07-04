resource "aws_key_pair" "dino-key" {
  key_name   = "dinokey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "vpro-nginx" {
  ami = var.AMIS[var.REGION]
  instance_type = "t2.micro"
  subnet_id = aws_subnet.vprofile-pub-1.id
  availability_zone = var.ZONE1
  key_name = aws_key_pair.dino-key.key_name
  #key_name = "Terra-Key"
  vpc_security_group_ids = [aws_security_group.vpro_stack_sg.id]
  tags = {
    Name = "my-dynos"
  }
}

resource "aws_ebs_volume" "vol_4_ngin" {
  availability_zone = "us-east-1a"
  size              = 5

  tags = {
    Name = "extra-vol-4-vprofile"
  }
}

resource "aws_volume_attachment" "attch_vol_nginx" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_ngin.id
  instance_id = aws_instance.vpro-nginx.id
}

provisioner "file"  {
    source = "web.sh"
   destination = "/tmp/web.sh"
  }
#provisioner "remote-exec" {
#    inline = [
#    "chmod u+x /tmp/web.sh",
#   "sudo /tmp/web.sh"
#    ]
#  }
#connection {
#    user = "ubuntu"
#    private_key = file(var.PRIV_KEY)
#    host = self.private_ip
# }

output "IP" {
  value = aws_instance.vpro-nginx.private_ip
}

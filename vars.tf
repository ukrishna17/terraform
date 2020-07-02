variable REGION {
  default = "us-east-1"
}
variable ZONE1 {
  default = "us-east-1a"
}

variable AMIS {
  type = map
  default = {
     us-east-1 = "ami-0ac80df6eff0e70b5"
     us-east-2 = "ami-0a63f96e85105c6d3"
     us-west-2 = "ami-003634241a8fcdec0"
  }
}
variable PUB_KEY {
  default = "dinokey.pub"
  }
variable PRIV_KEY {
  default = "dinokey"
  }

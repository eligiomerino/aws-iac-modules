/* By Eligio Merino, 2024
   https://github.com/eligiomerino
*/

locals {
    public_cidr = "0.0.0.0/0"
}

resource "aws_default_security_group" "default_sg" {
  vpc_id = var.vpc_id

  ingress {
    protocol  = var.protocol
    //self      = true
    from_port = var.port
    to_port   = var.port
    cidr_blocks = [local.public_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.public_cidr]
  }

  tags = {
    Name = var.name
  }  
}

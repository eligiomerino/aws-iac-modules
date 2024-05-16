/* By Eligio Merino, 2024
   https://github.com/eligiomerino
*/

resource "aws_default_route_table" "public_rt" {
  count  = var.should_be_updated ? 1 : 0
  default_route_table_id = var.default_rt_id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.name
  }
}

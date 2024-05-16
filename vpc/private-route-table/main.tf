/* By Eligio Merino, 2024
   https://github.com/eligiomerino
*/
resource "aws_route_table" "private_rt" {
  count  = var.should_be_created ? 1 : 0
  vpc_id = var.vpc_id

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.ngw_id
  }

  tags = {
    Name = var.name
  }
}

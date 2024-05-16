/* By Eligio Merino, 2024
   https://github.com/eligiomerino
*/
resource "aws_subnet" "subnet" {
  count                   = var.should_be_created ? 1 : 0
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr
  map_public_ip_on_launch = var.map_public_ip

  availability_zone = var.az
  
  tags = {
    Name = var.name
  }
}

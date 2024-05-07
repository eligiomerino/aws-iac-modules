/* By Eligio Merino, 2024
   https://github.com/eligiomerino
*/
resource "aws_internet_gateway" "igw" {
  count  = var.should_be_created ? 1 : 0
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}

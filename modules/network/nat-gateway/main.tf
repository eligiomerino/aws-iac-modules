/* By Eligio Merino, 2024
   https://github.com/eligiomerino
*/
resource "aws_eip" "ngw_eip" {
  domain = "vpc"

  tags = {
    Name = var.name
  }
}

resource "aws_nat_gateway" "ngw" {
  count  = var.should_be_created ? 1 : 0  

  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = var.subnet_id

  tags = {
    Name = var.name
  }

  depends_on = [aws_eip.ngw_eip]
}

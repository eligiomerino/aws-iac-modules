/* By Eligio Merino, 2024
   https://github.com/eligiomerino
*/

resource "aws_route_table_association" "subnet_association" {
  subnet_id      = var.subnet
  route_table_id = var.rt_id
}

/* By Eligio Merino, 2024
   https://github.com/eligiomerino
*/
resource "aws_vpc" "vpc" {
  count                = var.should_be_created ? 1 : 0
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = var.tags
}

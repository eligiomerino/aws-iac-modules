output "subnet_id" {
  description = "Subnet ID"
  value = concat(aws_subnet.subnet.*.id, [""])[0]
}

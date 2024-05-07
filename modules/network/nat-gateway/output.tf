output "id" {
    description = "NAT gateway ID"
    value = concat(aws_nat_gateway.ngw.*.id, [""])[0]
}

output "ip" {
    description = "NAT gateway IP"
    value = aws_eip.ngw_eip.public_ip
}

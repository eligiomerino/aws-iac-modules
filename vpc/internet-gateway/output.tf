output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = concat(aws_internet_gateway.igw.*.id, [""])[0]
}

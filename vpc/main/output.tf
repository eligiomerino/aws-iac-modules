output "vpc_id" {
  description = "VPC ID"
  value       = concat(aws_vpc.vpc.*.id, [""])[0]
}

output "vpc_arn" {
  description = "VPC ARN"
  value       = concat(aws_vpc.vpc.*.arn, [""])[0]
}

output "vpc_cidr_block" {
  description = "VPC CIDR block"
  value       = concat(aws_vpc.vpc.*.cidr_block, [""])[0]
}

output "default_route_table_id" {
  description = "VPC default route table ID"
  value = concat(aws_vpc.vpc.*.default_route_table_id, [""])[0]
}
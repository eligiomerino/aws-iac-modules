output "route_table_id" {
  description = "Route Table ID"
  value       = concat(aws_route_table.private_rt.*.id, [""])[0]
}

output "default_sg_id" {
    description = "Default security group ID"
    value = aws_default_security_group.default_sg.id
}

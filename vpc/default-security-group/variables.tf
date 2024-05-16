variable "vpc_id" {
    description = "VPC ID for the default security group"
    type = string
}

variable "name" {
    description = "Security Group name"
    type = string
}

variable "protocol" {
    description = "The default protocol for ingress traffic"
    type = string
}

variable "port" {
    description = "The default port for ingress traffic"
    type = number
}

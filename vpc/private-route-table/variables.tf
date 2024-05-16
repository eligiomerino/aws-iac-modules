variable "should_be_created" {
  description = "Should the Route Table be updated?"
  type        = bool
  default     = true
}

variable "name" {
  description = "Route Table name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ngw_id" {
  description = "NAT gateway ID"
  type        = string
}

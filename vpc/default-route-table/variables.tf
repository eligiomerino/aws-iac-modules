variable "should_be_updated" {
  description = "Should the Route Table be updated?"
  type        = bool
  default     = true
}

variable "name" {
  description = "Route Table name"
  type        = string
}

variable "default_rt_id" {
  description = "VPC default route table's ID"
  type = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
}


variable "should_be_created" {
  description = "Should the NAT Gateway be created?"
  type        = bool
  default     = true
}

variable "name" {
  description = "NAT gateway name"
  type        = string
  default     = "igw"
}

variable "subnet_id" {
  description = "Subnet ID where the NAT gateway will be hosted"
  type        = string
}

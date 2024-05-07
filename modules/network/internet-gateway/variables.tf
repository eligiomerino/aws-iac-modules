variable "should_be_created" {
  description = "Should the Internet Gateway be created?"
  type        = bool
  default     = true
}

variable "name" {
  description = "Internet Gateway name"
  type        = string
  default     = "igw"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

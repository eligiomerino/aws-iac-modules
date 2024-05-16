variable "should_be_created" {
  description = "Should the VPC be created?"
  type        = bool
  default     = true
}

variable "cidr" {
  description = "VPC IPv4 CIDR block"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Should instances in the VPC get public DNS hostnames?"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should the DNS resolution be supported?"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type = map
}
variable "should_be_created" {
  description = "Should the Public Subnet be created?"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "cidr" {
  description = "Subnet IPv4 CIDR block"
  type        = string
}

variable "az" { 
  description = "AZ name"
  type        = string 
}

variable "map_public_ip" {
  description = "Maps at launch public IP for public subnets"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to be added to the subnet"
  type = map
}
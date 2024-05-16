variable "should_be_updated" {
  description = "Should the Route Table be updated?"
  type        = bool
  default     = true
}

variable "rt_id" {
  description = "Route table ID"
  type = string
}

variable "subnet" {
  description = "Public subnet object"
  type        = string
}

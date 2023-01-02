variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vswitch_suffix" {
  description = "Suffix to append to VSwitches name"
  type        = string
  default     = "vswitch"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "vswitch_tags" {
  description = "Additional tags for the VSwitches."
  type        = map(string)
  default     = {}
}

variable "azs" {
  description = "The list of availability zone names in the region"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "A list of subnets inside the VPC"
  type        = list(string)
  default     = []
}

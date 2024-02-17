variable "public_subnets_cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
}

variable "private_subnets_cidr_blocks" {
  type    = list(string)
  default = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable vpc_cidr {
  type        = string
  #10.0.0.0/16
}

variable vpc_tag {
  type        = string
}

variable igw_tag {
  type        = string
}

variable rt_tag {
  type        = string
}






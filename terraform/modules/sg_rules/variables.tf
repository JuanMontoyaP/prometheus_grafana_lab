variable "sg_id" {
  description = "Security Group ID"
  type        = string
}


variable "sg_ingress_rules" {
  description = "SG rules to apply"
  type = map(object({
    name        = string
    description = string
    cidr_ipv4   = string
    from_port   = number
    to_port     = number
    ip_protocol = string
  }))
}

variable "sg_egress_rules" {
  description = "SG rules to apply"
  type = map(object({
    name        = string
    description = string
    cidr_ipv4   = string
    from_port   = number
    to_port     = number
    ip_protocol = string
  }))
  default = {
    "allow_all_outbound" = {
      name        = "allow_all_outbound"
      description = "Allow all outbound traffic"
      from_port   = -1
      to_port     = -1
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
}

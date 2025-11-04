resource "aws_vpc_security_group_ingress_rule" "this" {
  security_group_id = var.sg_id

  for_each = var.sg_ingress_rules

  description = each.value.description
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.ip_protocol
  cidr_ipv4   = each.value.cidr_ipv4
}

resource "aws_vpc_security_group_egress_rule" "this" {
  security_group_id = var.sg_id

  for_each = var.sg_egress_rules

  description = each.value.description
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.ip_protocol
  cidr_ipv4   = each.value.cidr_ipv4
}

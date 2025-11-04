output "sg_ingress_rule_ids" {
  description = "IDs of the security group ingress rules"
  value       = values(aws_vpc_security_group_ingress_rule.this)[*].security_group_rule_id
}

output "sg_egress_rule_ids" {
  description = "IDs of the security group egress rules"
  value       = values(aws_vpc_security_group_egress_rule.this)[*].security_group_rule_id
}

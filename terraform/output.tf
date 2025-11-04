output "ssh_key_file" {
  description = "Path to the SSH private key file"
  value       = local_file.private_key.filename
}

output "prometheus_ip" {
  description = "Public Ip address of the prometheus host"
  value       = aws_instance.prometheus_server.public_ip
}

output "prometheus_dns" {
  description = "DNS name of the prometheus host"
  value       = aws_instance.prometheus_server.public_dns
}

output "nodes_ips" {
  description = "Public IP addresses of the node exporter instances"
  value       = aws_instance.node_exporter[*].public_ip
}

output "nodes_dns" {
  description = "DNS names of the node exporter instances"
  value       = aws_instance.node_exporter[*].public_dns
}

output "grafana_dns" {
  description = "DNS names of the grafana server"
  value       = aws_instance.grafana_server.public_dns
}

output "grafana_ip" {
  description = "Public IP address of the grafana server"
  value       = aws_instance.grafana_server.public_ip
}

output "connection_instructions" {
  description = "Instructions for connecting to the prometheus server"
  value       = <<-EOT
    To connect to the prometheus server:
    ssh -i ${local_file.private_key.filename} ubuntu@${aws_instance.prometheus_server.public_ip}
  EOT
}

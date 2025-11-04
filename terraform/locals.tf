locals {
  ssh_sg = {
    name        = "ssh_access"
    description = "Allow SSH access from anywhere"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
  }

  port_9090_sg = {
    name        = "prometheus_access"
    description = "Allow Prometheus access from anywhere"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 9090
    to_port     = 9090
    ip_protocol = "tcp"
  }

  port_9100_sg = {
    name        = "metrics_access"
    description = "Allow Metrics access from anywhere"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 9100
    to_port     = 9100
    ip_protocol = "tcp"
  }

  port_8080_sg = {
    name        = "cadvisor_access"
    description = "Allow cAdvisor access from anywhere"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 8080
    to_port     = 8080
    ip_protocol = "tcp"
  }

  port_3000_sg = {
    name        = "grafana_access"
    description = "Allow Grafana access from anywhere"
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 3000
    to_port     = 3000
    ip_protocol = "tcp"
  }
}

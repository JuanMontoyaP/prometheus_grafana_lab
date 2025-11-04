
resource "aws_security_group" "prometheus_server" {
  name        = "prometheus_server_sg"
  description = "Security group for Prometheus server"
  vpc_id      = module.vpc.vpc_id
}

module "prometheus_sg" {
  source = "./modules/sg_rules"

  sg_id = aws_security_group.prometheus_server.id
  sg_ingress_rules = {
    ssh       = local.ssh_sg
    port_9090 = local.port_9090_sg
  }
}

resource "aws_security_group" "node_exporter_sg" {
  name        = "node_exporter_sg"
  description = "Security group for Node Exporter instances"
  vpc_id      = module.vpc.vpc_id
}

module "node_sg" {
  source = "./modules/sg_rules"

  sg_id = aws_security_group.node_exporter_sg.id
  sg_ingress_rules = {
    ssh          = local.ssh_sg
    port_8080_sg = local.port_8080_sg
    port_9100_sg = local.port_9100_sg
  }
}

resource "aws_security_group" "grafana_server_sg" {
  name        = "grafana_server_sg"
  description = "Security group for Grafana server"
  vpc_id      = module.vpc.vpc_id
}

module "grafana_sg_rule" {
  source = "./modules/sg_rules"

  sg_id = aws_security_group.grafana_server_sg.id
  sg_ingress_rules = {
    ssh       = local.ssh_sg
    port_3000 = local.port_3000_sg
  }
}

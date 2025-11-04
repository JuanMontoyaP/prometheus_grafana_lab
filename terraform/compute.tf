resource "aws_instance" "prometheus_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.host_key.key_name

  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.prometheus_server.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_prometheus_profile.name

  tags = {
    Name = "Prometheus-Server"
  }
}

resource "aws_instance" "node_exporter" {
  count         = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.host_key.key_name

  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.node_exporter_sg.id]

  tags = {
    Name = "Node-Exporter"
  }
}

resource "aws_instance" "grafana_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.host_key.key_name

  subnet_id                   = module.vpc.public_subnets[1]
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.grafana_server_sg.id]

  tags = {
    Name = "Grafana-Server"
  }
}

resource "aws_security_group" "ssh-jenkins" {
  name        = var.security_group_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = merge(var.custom_tags, {
    Name = var.security_group_name
  })
}

resource "aws_vpc_security_group_ingress_rule" "allow-ssh-jenkins" {
  security_group_id = aws_security_group.ssh-jenkins.id
  for_each =  {for id,rule in var.ingress_ports: id => rule}
  cidr_ipv4   =  each.value.cidr_ipv4
  from_port   =  each.value.port
  ip_protocol = each.value.protocol
  to_port     = each.value.port
  tags = var.custom_tags
}

resource "aws_vpc_security_group_egress_rule" "allow-all" {
  security_group_id = aws_security_group.ssh-jenkins.id
  count = length(var.egress_ports) 
  cidr_ipv4   = var.egress_ports[count.index].cidr_ipv4
  from_port   = var.egress_ports[count.index].port
  ip_protocol = var.egress_ports[count.index].protocol
  to_port     =  var.egress_ports[count.index].port
  tags = var.custom_tags
}
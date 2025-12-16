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
  for_each = var.ingress_ports
  cidr_ipv4   =  each.value.cidr_ipv4
  from_port   =  each.value.port
  ip_protocol = each.value.protocol
  to_port     = each.value.port
  tags = var.custom_tags
}

resource "aws_vpc_security_group_egress_rule" "allow-all" {
  security_group_id = aws_security_group.ssh-jenkins.id
  for_each = var.egress_ports
  cidr_ipv4   =  each.value.cidr_ipv4
  from_port   =  each.value.port
  ip_protocol = each.value.protocol
  to_port     = each.value.port
  tags = var.custom_tags
}


resource "aws_key_pair" "jenkins_instance_key" {
  key_name   = "Jenkins_key"
  public_key = var.public_key
  tags = var.custom_tags
}

resource "aws_instance" "jenkins_instance" {
  ami = var.ami_id
  associate_public_ip_address = var.assign_public_ip
  instance_type = var.instance_type
  key_name = aws_key_pair.jenkins_instance_key.key_name
  vpc_security_group_ids = [aws_security_group.ssh-jenkins.id]
  subnet_id = var.subnet_id
  user_data = var.user_data
  metadata_options {
    http_tokens = "required"
  }
  tags = merge(var.custom_tags, {
    Name = var.instance_name
  })
}





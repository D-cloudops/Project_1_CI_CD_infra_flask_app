resource "aws_key_pair" "jenkins_instance_key" {
  key_name   = var.ec2_key_pair_name
  public_key = var.public_key
  tags = var.custom_tags
}

resource "aws_instance" "jenkins_instance" {
  ami = var.ami_id
  associate_public_ip_address = var.assign_public_ip
  instance_type = var.instance_type
  key_name = aws_key_pair.jenkins_instance_key.key_name
  vpc_security_group_ids = var.ec2_sg_id
  subnet_id = var.subnet_id
  user_data = var.user_data
  metadata_options {
    http_tokens = "required"
  }
  tags = merge(var.custom_tags, {
    Name = var.instance_name
  })
}





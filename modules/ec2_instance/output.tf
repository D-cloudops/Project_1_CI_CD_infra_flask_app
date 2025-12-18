output "key_name" {
  value = aws_key_pair.jenkins_instance_key.key_name
}

output "instance_id" {
   value = aws_instance.jenkins_instance.id
}
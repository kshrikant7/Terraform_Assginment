# modules/ec2-instance/outputs.tf

output "public_instance_id" {
  value = aws_instance.public_instance.public_ip
}

output "private_instance_id" {
  value = aws_instance.private_instance.private_ip
}

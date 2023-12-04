output "public_instance" {
  value = module.ec2_instance.aws_instance.public_instance_id.public_ip
}

output "private_instance" {
    value = module.ec2_instance.aws_instance.private_instance_id.private_ip
}

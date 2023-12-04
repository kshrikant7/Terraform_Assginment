output "public_instance" {
  value = module.ec2_instance.public_instance_id
}

output "private_instance" {
    value = module.ec2_instance.private_instance_id
}

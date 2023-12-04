output "public_instance" {
  value = module.ec2_instance.public_instance.public_ip
}

output "private_instance" {
    value = module.ec2_instance.private_instance.private_ip
}

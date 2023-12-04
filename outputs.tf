output "public_instance_ip" {
  description = "The public IP of the public instance"
  value       = module.ec2.public_instance_ip
}

output "private_instance_ip" {
  description = "The private IP of the private instance"
  value       = module.ec2.private_instance_ip
}
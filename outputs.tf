output "public_instance_ip" {
  description = "The public IP of the public instance"
  value       = module.ec2.aws_instance.public_instance.public_ip
}

output "private_instance_ip" {
  description = "The private IP of the private instance"
  value       = module.ec2.aws_instance.private_instance.private_ip
}
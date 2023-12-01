variable "region" {
  description = "The region where AWS operations will take place"
  default = "us-east-1"
}

variable "key_name" {
  description = "The key name to use for the instance"
  default = "ec2-key"
}

variable "profile" {
  description = "The AWS profile to use"
  default = "default"
}

variable "ami"{
    description = "The AMI to use"
    default = "ami-01b66f9994a4d8384"
}

variable "instance_type" {
    description = "The type of instance to launch"
    default = "t2.micro"
}

variable "user" {
    description = "The user to use for the instance"
    default = "ec2-user"
}
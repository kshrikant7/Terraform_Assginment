
# ec2.tf

resource "aws_instance" "public_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key_pair.key_name
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "public_instance"
#ec2

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "aws_instance" "public_instance" {
  ami                    = "ami-01b66f9994a4d8384"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = aws_key_pair.ec2_key_pair.key_name

  tags = {
    Name = "Public Instance"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo service nginx start",
      "sudo chkconfig nginx on",
      "sudo echo '${tls_private_key.ssh_key.private_key_pem}' > /home/ec2-user/private_key.pem",
      "sudo chmod 400 /home/ec2-user/private_key.pem"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = tls_private_key.my_private_key.private_key_pem
      private_key  = tls_private_key.ssh_key.private_key_pem
      host = self.public_ip
    }
  }
}

resource "aws_instance" "private_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key_pair.key_name
  subnet_id     = aws_subnet.private_subnet.id

  tags = {
    Name = "private_instance"
  }

  provisioner "remote-exec" {
    inline = [
      # Add any provisioning steps for private instance if needed
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = tls_private_key.my_private_key.private_key_pem
    }
  }
}

# Decode the SSH private key stored in Jenkins credentials
data "tls_private_key" "my_private_key" {
  private_key_pem = base64decode(credentials("SSH_Private"))
}
  ami                    = "ami-01b66f9994a4d8384"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = aws_key_pair.ec2_key_pair.key_name
  
  user_data = file("user.sh")

  tags = {
    Name = "Private Instance"
  }
}

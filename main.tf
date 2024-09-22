# # 1. Create a VPC
# resource "aws_vpc" "mobann_vpc" {
#   cidr_block = "10.0.0.0/16"
# }

# # 2. Create Internet Gateway
# resource "aws_internet_gateway" "mobann-gw" {
#   vpc_id = aws_vpc.mobann_vpc.id

#   tags = {
#     Name = "Mobann IGW"
#   }
# }

# # 3. Create a Route Table
# resource "aws_route_table" "mobann-RT" {
#   vpc_id = aws_vpc.mobann_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.mobann-gw.id
#   }

#   tags = {
#     Name = "Mobann Route Table"
#   }
# }

# # 4. Create a Subnet
# resource "aws_subnet" "public-subnet" {
#   vpc_id            = aws_vpc.mobann_vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-2a"

#   tags = {
#     Name = "Mobann subnet"
#   }
# }

# # 5. Associate the Subnet with the Route Table
# resource "aws_route_table_association" "subnet-associate" {
#   subnet_id      = aws_subnet.public-subnet.id
#   route_table_id = aws_route_table.mobann-RT.id
# }

# # 6. Create Security Group to allow ports 80 and 22
# resource "aws_security_group" "webserv-sg" {
#   name        = "allow_web_traffic"
#   vpc_id      = aws_vpc.mobann_vpc.id
#   description = "Allow inbound traffic from 22,80"

#   ingress {
#     description = "Allow HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Allow SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]

#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # 7. Create a Network Interface with an IP in the subnet that was created in step 4
# resource "aws_network_interface" "webserver-nic" {
#   subnet_id       = aws_subnet.public-subnet.id
#   private_ips     = ["10.0.1.50"]
#   security_groups = [aws_security_group.webserv-sg.id]
# }

# # 8. Assign an Elastic IP to the Network Interface created in step 7
# resource "aws_eip" "mobann-eip" {
#   domain                    = "vpc"
#   network_interface         = aws_network_interface.webserver-nic.id
#   associate_with_private_ip = "10.0.1.50"
#   depends_on                = [aws_internet_gateway.mobann-gw]
# }

# # 9. Create an Ubuntu server and install/enable apache2
# resource "aws_instance" "mobann-web" {
#   ami               = "ami-085f9c64a9b75eed5"
#   instance_type     = "t3.micro"
#   availability_zone = "us-east-2a"
#   key_name          = "ohio_kp"
#   depends_on        = [aws_eip.mobann-eip]

#   network_interface {
#     network_interface_id = aws_network_interface.webserver-nic.id
#     device_index         = 0
#   }

#   user_data = <<-EOF
#               #!/bin/bash
#               sudo apt update -y
#               sudo apt install apache2 -y
#               sudo systemctl start apache2
#               sudo systemctl enable apache2
#               sudo bash -c 'echo Hello Henry > /var/www/html/index.html'
#               EOF

#   tags = {
#     Name = "Mobann Server"
#   }
# }

# #10. Output the Public IP and Private IP of the Instance
# output "server_public_ip" {
#   value = aws_eip.mobann-eip.public_ip
# }

# output "server_private_ip" {
#   value = aws_instance.mobann-web.private_ip
# }

# #Generate a new RSA  key pair
# resource "tls_private_key" "mobann-key" {
#   algorithm = "RSA"
#   rsa_bits = 4096
# }

# #create a new key pair
# resource "aws_key_pair" "mobann-key" {
#  key_name = "mobann-key"
#  public_key = tls_private_key.mobann-key.public_key_openssh  
# }

# #create a local file to store the private key
# resource "local_file" "mobann-key" {
#  content = tls_private_key.mobann-key.private_key_pem
#  filename = "mobann-key.pem"  
# }

# #Get latest version of Amazon  Linux 2 AMI
# data "aws_ami" "amazon-linux-2" {
#  owners = ["amazon"]
#  most_recent = true

#  filter {
#    name = "name"
#    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#  }

# }
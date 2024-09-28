# resource "aws_eip" "eip_nat_gateway_az1" {
#   domain = "vpc"
#   tags = {
#    Name = "${var.project_name}-${var.environment}-eip_nat_gateway_az1"
#   }
# }

# resource "aws_eip" "eip_nat_gateway_az2" {
#   domain = "vpc"
#   tags = {
#    Name = "${var.project_name}-${var.environment}-eip_nat_gateway_az2" 
#   }
# }

# resource "aws_nat_gateway" "nat_gateway_az1" {
#   allocation_id = aws_eip.eip_nat_gateway_az1.id
#   subnet_id = aws_subnet.public_subnet_az1.id

#   tags = {
#     Name = "${var.project_name}-${var.environment}-nat_gateway_az1"
#   }
#   depends_on = [aws_internet_gateway.internet_gateway]
# }

# resource "aws_nat_gateway" "nat_gateway_az2" {
#   allocation_id = aws_eip.eip_nat_gateway_az2.id
#   subnet_id = aws_subnet.public_subnet_az2.id

#   tags = {
#     Name = "${var.project_name}-${var.environment}-nat_gateway_az2"
#   }
#   depends_on = [aws_internet_gateway.internet_gateway]
# }

# resource "aws_route_table" "Private_RT_AZ1" {
#   vpc_id = aws_vpc.Training_vpc.id

#   route {
# cidr_block =   "0.0.0.0/0"
# nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id

#   }
#   tags = {
#    Name = "${var.project_name}-${var.environment}-Private_RT_AZ1"
#   }
# }

# resource "aws_route_table_association" "Private_app_subnet_az1_rt_association" {
#   subnet_id = aws_subnet.private_app_subnet_az1.id
#   route_table_id = aws_route_table.Private_RT_AZ1.id
# }

# resource "aws_route_table_association" "Private_data_subnet_az1_rt_association" {
#   subnet_id = aws_subnet.private_data_subnet_az1.id
#   route_table_id = aws_route_table.Private_RT_AZ1.id
# }

# resource "aws_route_table" "Private_RT_AZ2" {
#   vpc_id = aws_vpc.Training_vpc.id

#   route {
# cidr_block =   "0.0.0.0/0"
# nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id

#   }
#   tags = {
#    Name = "${var.project_name}-${var.environment}-Private_RT_AZ2"
#   }
# }

# resource "aws_route_table_association" "Private_app_subnet_az2_rt_association" {
#   subnet_id = aws_subnet.private_app_subnet_az2.id
#   route_table_id = aws_route_table.Private_RT_AZ2.id
# }

# resource "aws_route_table_association" "Private_data_subnet_az2_rt_association" {
#   subnet_id = aws_subnet.private_data_subnet_az2.id
#   route_table_id = aws_route_table.Private_RT_AZ2.id
# }



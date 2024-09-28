# resource "aws_security_group" "alb_security_group" {
#  name        = "alb_security_group"
#  description = "Security group for ALB"
#  vpc_id = aws_vpc.Training_vpc

#  ingress {
# description = "alb access"
# from_port = 80
# to_port = 80
# protocol = "http"


#  }
  
# }